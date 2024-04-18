import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';

class ProductFeaturedImage extends StatelessWidget {
  const ProductFeaturedImage({
    super.key,
    required this.productFeaturedImage,
  });

  final String? productFeaturedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 140,
        child: Image.network(
          productFeaturedImage ?? "",
          errorBuilder: (c, i, s) => Image.asset(
            catImg,
            width: 70,
            height: 70,
          ),
        ),
      ),
    );
  }
}
