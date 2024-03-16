import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      elevation: 0,
      child: Row(
        children: [
          10.0.width(),
          Expanded(
            flex: 4,
            child: Card(
              elevation: 0,
              color: cFAFAFA,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  product,
                  height: 100,
                  width: 200,
                ),
              ),
            ),
          ),
          10.0.width(),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Indo Us Black Gram Rajavi 11",
                  style: txtMediumF14c383838,
                ),
                10.0.height(),
                DiscountPrice(
                  price: "1230",
                ),
              ],
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
