import 'package:flutter/material.dart';

import '../../barrel.dart';

class OriginalPrice extends StatelessWidget {
  const OriginalPrice({super.key, required this.price, this.font18 = false});

  final String? price;
  final bool font18;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\u{20B9}${price ?? ""}",
      style: font18 ? txtMediumF18c7C7C7C.copyWith(
        decoration: TextDecoration.lineThrough,
      ) : txtMediumF14c7C7C7C.copyWith(
        decoration: TextDecoration.lineThrough,
      ),
    );
  }
}
