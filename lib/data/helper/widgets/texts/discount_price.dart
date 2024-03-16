import 'package:flutter/material.dart';

import '../../barrel.dart';

class DiscountPrice extends StatelessWidget {
  const DiscountPrice({super.key, required this.price,  this.font18 = false});

  final String? price;
  final bool font18;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\u{20B9}${price ?? ""}",
      style: font18 ? txtMediumF18cPrimary: txtMediumF14cPrimary,
    );
  }
}
