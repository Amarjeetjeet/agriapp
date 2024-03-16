import '../../../../data/helper/barrel.dart';
import 'package:flutter/material.dart';

import '../../widgets/price_calculation.dart';

class PaymentStatusUi extends StatelessWidget {
  const PaymentStatusUi({super.key, this.isSuccess = true});

  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cScaffoldBg,
      appBar: CustomAppBar(
        suffixIcon: Icons.notifications_none_sharp,
        title: isSuccess ? "Success" : "Failed",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              40.0.height(),
              Image.asset(
                isSuccess ? success : failure,
                width: 120,
              ),
              30.0.height(),
              Text(
                "Payment ${isSuccess ? "Successful!" : "Failed!"}",
                style: txtMediumF24c383838,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  isSuccess
                      ? "Your Payment was successful! Thanks for using our application"
                      : "Something went wrong. Don't worries! Let's try again",
                  style: txtRegularF14c7C7C7C,
                  textAlign: TextAlign.center,
                ),
              ),
              20.0.height(),
              const PriceCalculation(
                totalPrice: 340.00,
                shippingCharges: 60.00,
                discountPrice: 100.00,
                netPrice: 200.00,
                orderId: "#1234434",
              ),
              20.0.height(),
              if (isSuccess) ...[
                PrimaryButton(
                  onTap: () {},
                  btnName: "Track Order",
                ),
              ],
              if (!isSuccess) ...[
                PrimaryButton(
                  onTap: () {},
                  btnName: "Try again",
                ),
              ],
              40.0.height(),
            ],
          ),
        ),
      ),
    );
  }
}
