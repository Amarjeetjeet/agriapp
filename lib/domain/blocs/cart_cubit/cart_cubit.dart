import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/local/database_helper/database_helper.dart';
import '../../models/cart/cart_item.dart';
import 'cart_state.dart';

class CartItemCubit extends Cubit<CartState> {
  final DatabaseHelper databaseHelper;

  CartItemCubit({required this.databaseHelper}) : super(const CartState());

  Future<void> getCartItems() async {
    final items = await databaseHelper.getCartItems();
    List<CartItems> cList =
        items.map((json) => CartItems.fromJson(json)).toList();

    debugPrint("Items count $items");

    calculateNetPrice();
    emit(state.copyWith(cartItems: cList));
  }

  Future<void> getQuantity({required int? productId}) async {
    int count = await databaseHelper.getProductQuantity(productId ?? 0);
    debugPrint("The count is $count");
    await getCartItems();
    emit(state.copyWith(counter: count));
  }

  Future<void> addItem({
    required int productId,
    required String productImage,
    required String productName,
    required String discountedPrice,
    required String regularPrice,
  }) async {
    await databaseHelper.addItemToCart(
      productId: productId,
      productImage: productImage,
      productName: productName,
      discountedPrice: discountedPrice,
      regularPrice: regularPrice,
    );
    await getCartItems();
    await getQuantity(productId : productId);

  }

  Future<void> incrementQuantity(int id) async {
    await databaseHelper.incrementQuantity(id);
    await getCartItems();
    await getQuantity(productId : id);
  }

  Future<void> decrementQuantity(int id) async {
    await databaseHelper.decrementQuantity(id);
    await getCartItems();
    await getQuantity(productId : id);
  }

  double calculateTotalPrice() {
    final products = state.cartItems;
    double total = 0;
    for (var item in products) {
      total += (item.discountedPrice ?? 0) * (item.quantity ?? 0);
    }
    return total;
  }

  double calculateNetPrice() {
    final products = state.cartItems;
    double total = 0;
    double shippingCharge = 80;
    for (var item in products) {
      total += (item.discountedPrice ?? 0) * (item.quantity ?? 0);
    }
    return total + shippingCharge - calculateDiscountedPrice();
  }

  double calculateDiscountedPrice() {
    // final products = state;
    // double discountedTotal = 0;
    // for (var item in products) {
    //   discountedTotal += (item.regularPrice ?? 0) * (item.quantity ?? 0);
    // }
    return 0;
    // return discountedTotal - calculateNetPrice() ;
  }
}
