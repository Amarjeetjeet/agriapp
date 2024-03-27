import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.widget,
    this.productName,
    this.productPrice,
    this.productImage,
  });

  final Widget widget;
  final String? productName;
  final String? productPrice;
  final String? productImage;

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
                child: Image.network(
                  productImage ?? "",
                  height: 100,
                  width: 200,
                  errorBuilder: (___,__,_) => const Icon(Icons.error_outline),
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
                  productName ?? "",
                  style: txtMediumF14c383838,
                ),
                10.0.height(),
                DiscountPrice(
                  price: productPrice ?? "",
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
