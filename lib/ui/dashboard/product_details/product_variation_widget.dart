import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/ui/dashboard/product_details/product_details.dart';
import 'package:agriapp/ui/dashboard/product_details/product_feature_image.dart';
import 'package:agriapp/ui/dashboard/product_details/product_variation_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ProductVariationWidget extends StatelessWidget {
  const ProductVariationWidget({
    super.key,
    required this.productName,
    required this.productMinPrice,
    required this.productMinRegular,
    required this.productMaxPrice,
    required this.productFeaturedImage,
    required this.productId,
  });

  final String? productName;
  final int? productId;
  final String? productMinPrice;
  final String? productMinRegular;
  final String? productMaxPrice;
  final String? productFeaturedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Card(
          elevation: 1,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          margin: EdgeInsets.zero,
          color: Colors.white,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                3.h.height(),
                ProductFeaturedImage(
                  productFeaturedImage: productFeaturedImage,
                ),
                3.h.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    productName ?? "Product name not available",
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: txtMediumF14c383838,
                  ),
                ),
                0.6.h.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DiscountPrice(
                        price: "$productMinPrice - \u{20B9}$productMaxPrice",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            alignment: Alignment.center,
            width: 100,
            child: Text(
              "${HelperFunctions.calculateDiscountPercentage(
                productMinRegular,
                productMinPrice,
              )}% OFF",
              style: txtMediumF12cWhite,
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductVariationDetails(
                      productId: productId,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
