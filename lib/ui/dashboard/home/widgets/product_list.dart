import 'package:agriapp/data/helper/barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../domain/blocs/featured_product_cubit/featured_product_cubit.dart';
import '../../../../domain/blocs/state_api/state_api.dart';
import '../../../../domain/models/product/featured_product_response.dart';
import '../../category/category_wise_product/category_wise_products.dart';
import '../../product_details/product_widget.dart';
import 'header_with_button.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedProductCubit, StateApi>(
      builder: (context, state) {
        return switch (state) {
          LoadingState() => const SizedBox(),
          FailureState() => const SizedBox(),
          EmptyState() => const SizedBox(),
          SuccessState() => Column(
              children: [
                1.3.h.height(),
                HeaderWithButton(
                  title: (state.success as FeaturedProduct)
                          .featuredCategories
                          ?.categoryName ??
                      "",
                  btnText: 'See All',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CategoryWiseProducts(
                          categoryId: (state.success as FeaturedProduct)
                                  .featuredCategories
                                  ?.categoryId ??
                              0,
                          categoryName: (state.success as FeaturedProduct)
                                  .featuredCategories
                                  ?.categoryName ??
                              "",
                        ),
                      ),
                    );
                  },
                ),
                1.h.height(),
                Container(
                  height: 300,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: (state.success as FeaturedProduct)
                        .featuredCategories
                        ?.product
                        ?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) {
                      Product? product = (state.success as FeaturedProduct)
                          .featuredCategories
                          ?.product?[i];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductWidget(
                          productId: product?.productId,
                          productName: product?.productName,
                          productSalePrice: product?.productSalePrice,
                          productRegularPrice: product?.productRegularPrice,
                          productFeaturedImage:
                              product?.productImageFeaturedImageLink,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        };
      },
    );
  }
}
