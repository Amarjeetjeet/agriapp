import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';

import '../../../data/helper/barrel.dart';
import '../../../data/helper/hash_service.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/price_calculation.dart';

class PaymentUi extends StatefulWidget {
  const PaymentUi({super.key});

  @override
  State<PaymentUi> createState() => _PaymentUiState();
}

class _PaymentUiState extends State<PaymentUi>{
    // implements PayUCheckoutProProtocol {
  bool orderVisible = true;

  // late PayUCheckoutProFlutter _checkoutPro;

  List<String> paymentMethod = ["Cash On Delivery", "payUBiz"];

  late String selectedValue;

  @override
  void initState() {
    selectedValue = paymentMethod[0];
    // _checkoutPro = PayUCheckoutProFlutter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cScaffoldBg,
      appBar: const CustomAppBar(
        title: 'Payment',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                color: Colors.white,
                elevation: 0,
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () {
                        setState(() {
                          orderVisible = !orderVisible;
                        });
                      },
                      child: Ink(
                        height: 60,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              orderVisible = !orderVisible;
                            });
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Row(
                            children: [
                              30.0.width(),
                              Text(
                                "Order Summary",
                                style: txtMediumF16cWhite,
                              ),
                              const Spacer(),
                              SvgHelper(
                                imagePath: orderVisible ? arrowUp : arrowDown,
                              ),
                              30.0.width(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (orderVisible) ...[
                      15.0.height(),
                      buildCard(),
                      Divider(
                        color: cEEE,
                      ),
                      buildCard(),
                    ]
                  ],
                ),
              ),
              10.0.height(),
              ListView.separated(
                shrinkWrap: true,
                itemCount: paymentMethod.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    tileColor: Colors.white,
                    selectedTileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    value: paymentMethod[index],
                    selected: selectedValue == paymentMethod[index],
                    groupValue: selectedValue,
                    title: Text(
                      paymentMethod[index],
                      style: txtMediumF18c7C7C7C,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value ?? "";
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 8);
                },
              ),
              10.0.height(),
              const PriceCalculation(
                totalPrice: 340.00,
                shippingCharges: 60.00,
                discountPrice: 100.00,
                netPrice: 200.00,
              ),
              10.0.height(),
              PrimaryButton(
                onTap: () {},
                btnName: "Make Payment",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return CartItemCard(
      widget: Container(
        width: 60,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32.0),
            bottomLeft: Radius.circular(32.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Text(
          "2",
          style: txtMediumF12cWhite,
        ),
      ),
    );
  }

}

