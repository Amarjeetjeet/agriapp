import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';

class PriceCalculation extends StatelessWidget {
  const PriceCalculation({
    super.key,
    required this.totalPrice,
    required this.shippingCharges,
    required this.discountPrice,
    required this.netPrice,
    this.orderId,
  });

  final double totalPrice, shippingCharges, discountPrice, netPrice;

  final String? orderId;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: txtRegularF14c383838,
                ),
                Text(
                  "\u{20B9}$totalPrice",
                  style: txtMediumF16c383838,
                )
              ],
            ),
            10.0.height(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Charges",
                  style: txtRegularF14c383838,
                ),
                Text(
                  "\u{20B9} $shippingCharges",
                  style: txtMediumF16c383838,
                )
              ],
            ),
            10.0.height(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount",
                  style: txtRegularF14c383838,
                ),
                Text(
                  "\u{20B9} $discountPrice",
                  style: txtMediumF16c383838,
                )
              ],
            ),
            10.0.height(),
            Divider(
              color: cEEE,
            ),
            10.0.height(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Net Price",
                  style: txtSemiBoldF16c383838,
                ),
                Text(
                  "\u{20B9} $netPrice",
                  style: txtSemiBoldF16c383838,
                )
              ],
            ),
            if (orderId != null) ...[
              10.0.height(),
              Divider(
                color: cEEE,
              ),
              10.0.height(),
              Text(
                "Order $orderId",
                style: txtRegularF14c7C7C7C,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
