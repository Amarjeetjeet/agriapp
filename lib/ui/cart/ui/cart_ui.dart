import 'package:agriapp/domain/blocs/cart_cubit/cart_cubit.dart';
import 'package:agriapp/domain/models/cart/cart_item.dart';
import 'package:agriapp/domain/models/model/shipping_address_response.dart';
import 'package:agriapp/domain/models/order/order_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/helper/barrel.dart';
import '../../../data/router/rounter_config.dart';
import '../../../domain/blocs/cart_cubit/cart_state.dart';
import '../../../domain/blocs/address_cubit/address_cubit.dart';
import '../address/select_address_ui.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/price_calculation.dart';

class CartUi extends StatelessWidget {
  const CartUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: cScaffoldBg,
          appBar: const CustomAppBar(
            title: 'Cart',
            hideCartIcon: false,
          ),
          body: state.cartItems.isEmpty
              ? const DisplayError(
                  errorMessage: "No Item in cart!",
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      children: [
                        10.0.height(),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.cartItems.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            CartItems item = state.cartItems[index];
                            return buildCard(item: item, context: context);
                          },
                        ),
                        10.0.height(),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                            ),
                            hintText: 'Promo code',
                            hintStyle: txtMediumF14c7C7C7C,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 16.0,
                            ),
                            suffixIcon: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Apply",
                                style: txtSemiBoldF14Primary,
                              ),
                            ),
                          ),
                        ),
                        10.0.height(),
                        PriceCalculation(
                          totalPrice: context
                              .read<CartItemCubit>()
                              .calculateTotalPrice(),
                          shippingCharges: 0.00,
                          discountPrice: context
                              .read<CartItemCubit>()
                              .calculateDiscountedPrice(),
                          netPrice: context
                              .read<CartItemCubit>()
                              .calculateNetPrice(),
                        ),
                        10.0.height(),
                        PrimaryButton(
                          onTap: state.cartItems.isEmpty
                              ? null
                              : () {
                                  List<ProductData> productData = [];

                                  for (var item in state.cartItems) {
                                    productData.add(
                                      ProductData(
                                        productId: item.productId.toString(),
                                        qty: item.quantity.toString(),
                                      ),
                                    );
                                  }

                                  OrderInput orderInput = OrderInput(
                                    createOrder: CreateOrder(
                                      productData: productData,
                                      shippingData: ShippingData(
                                        deviveryCharg: "0",
                                      ),
                                      paymentData: PaymentData(
                                        paymentMethod: "cod",
                                        paymentMethodTitle:
                                            "Cash on delivery",
                                      ),
                                      cuponData: CuponData(
                                        cuponCode: "",
                                        cuponType: "",
                                      ),
                                    ),
                                  );
                                  debugPrint("Item is $productData");
                                  // debugPrint("Item is $orderInput");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddressUi(orderInput: orderInput),
                                    ),
                                  );
                                },
                          btnName: "Place Order",
                        ),
                        10.0.height(),
                        SecondaryButton(
                          onTap: () {
                            context
                                .pushReplacementNamed(RouterUtil.dashboard);
                          },
                          btnName: "Continue Shopping",
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Card buildAddressCard(ShippingAddressResponse? state) {
    return Card(
      child: Column(
        children: [
          Text(state?.userBillingAddress?.billingAddress1 ?? ""),
        ],
      ),
    );
  }

  Widget buildCard({required CartItems item, required BuildContext context}) {
    return CartItemCard(
      productName: item.productName,
      productPrice: item.discountedPrice.toString(),
      productImage: item.productImage,
      widget: Container(
        color: primaryColor.withOpacity(.08),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          children: [
            RoundedIconBtn(
              iconData:
                  item.quantity == 1 ? Icons.delete_outline : Icons.remove,
              onTap: () {
                debugPrint("item count is ${item.productId}");
                context
                    .read<CartItemCubit>()
                    .decrementQuantity(item.productId ?? 0);
              },
            ),
            8.0.height(),
            Text(
              item.quantity.toString(),
              style: txtMediumF14c383838,
            ),
            8.0.height(),
            RoundedIconBtn(
              iconData: Icons.add,
              onTap: () {
                context
                    .read<CartItemCubit>()
                    .incrementQuantity(item.productId ?? 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
