import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/local/database_helper/database_helper.dart';
import '../../models/cart/cart_item.dart';

class CartListCubit extends Cubit<List<CartItems>> {
  late DatabaseHelper _databaseHelper;

  CartListCubit() : super([]) {
    _databaseHelper = DatabaseHelper();
    getCartItems();
  }

  Future<void> getCartItems() async {
    final items = await _databaseHelper.getCartItems();
    List<CartItems> cList =
        items.map((json) => CartItems.fromJson(json)).toList();

    debugPrint("Items count $items");

    calculateNetPrice();
    emit(cList);
  }

  Future<void> addItem({
    required int productId,
    required String productImage,
    required String productName,
    required String discountedPrice,
    required String regularPrice,
  }) async {
    await _databaseHelper.addItemToCart(
      productId: productId,
      productImage: productImage,
      productName: productName,
      discountedPrice: discountedPrice,
      regularPrice: regularPrice,
    );
    getCartItems();
  }

  Future<void> incrementQuantity(int id) async {
    await _databaseHelper.incrementQuantity(id);
    getCartItems();
  }

  Future<void> decrementQuantity(int id) async {
    await _databaseHelper.decrementQuantity(id);
    getCartItems();
  }

  double calculateTotalPrice() {
    final products = state;
    double total = 0;
    for (var item in products) {
      total += (item.discountedPrice ?? 0) * (item.quantity ?? 0);
    }
    return total;
  }

  double calculateNetPrice() {
    final products = state;
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
