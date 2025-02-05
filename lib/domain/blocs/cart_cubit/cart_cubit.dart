import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/app_network_call.dart';

class CartItemCubit extends Cubit<FormStateApi> {
  CartItemCubit() : super(const FormStateApi());

  Future<void> getCartItems() async {}

  Future<void> getQuantity({required int? productId}) async {}

  Future<void> addItem({
    required int productId,
  }) async {
    try {
      emit(
        const FormStateApi(
          formLoadingState: FormLoadingState.loading,
          errorMessage: "",
        ),
      );
      Map<String, dynamic>? response =
          await AppNetworkCall.addToCart(productId: productId);

      if ((response?["status"] == true)) {
        emit(
          FormStateApi(
            formLoadingState: FormLoadingState.success,
            errorMessage: response?["message"] ?? "Product added to cart successfully.",
          ),
        );
      }
    } catch (e) {
      emit(
        const FormStateApi(
          formLoadingState: FormLoadingState.failure,
          errorMessage: "Something went wrong",
        ),
      );
    }
  }

  Future<void> incrementQuantity(int id) async {}

  Future<void> decrementQuantity(int id) async {}

  double calculateTotalPrice() {
    // final products = state.cartItems;
    // double total = 0;
    // for (var item in products) {
    //   total += (item.discountedPrice ?? 0) * (item.quantity ?? 0);
    // }
    // return total;
    return 0;
  }

  double calculateNetPrice() {
    // final products = state.cartItems;
    // double total = 0;
    // double shippingCharge = 0;
    // for (var item in products) {
    //   total += (item.discountedPrice ?? 0) * (item.quantity ?? 0);
    // }
    // return total + shippingCharge - calculateDiscountedPrice();
    return 0;
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
