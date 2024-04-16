import 'package:agriapp/ui/dashboard/product_details/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/helper/barrel.dart';
import '../../../../domain/blocs/category_cubit/category_cubit.dart';
import '../../../../domain/blocs/state_api/state_api.dart';
import '../../../../domain/models/product/prodct_by_category_response.dart';
import '../../product_details/product_variation_widget.dart';

class CategoryWiseProducts extends StatelessWidget {
  const CategoryWiseProducts({
    super.key,
    this.categoryName,
    required this.categoryId,
  });

  final String? categoryName;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()
        ..productByCategory(
          categoryId: categoryId,
        ),
      child: AppScaffold(
        appBar: CustomAppBar(
          title: (categoryName ?? "").toUpperCase().replaceAll("-", " "),
          onBackPress: () => context.pop(),
        ),
        body: BlocBuilder<CategoryCubit, StateApi>(
          builder: (context, state) {
            return switch (state) {
              LoadingState() => const Loader(),
              FailureState() => DisplayError(errorMessage: state.errorMessage),
              EmptyState() => const EmptyList(),
              SuccessState() => AlignedGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: const EdgeInsets.all(16),
                  itemCount: ((state.success as CategoryByProduct)
                              .categoryProductList
                              ?.product ??
                          [])
                      .length,
                  itemBuilder: (context, index) {
                    CategoryByProduct? product = state.success;
                    if (product?.categoryProductList?.product?[index]
                            .isVariationProduct ??
                        false) {
                      return ProductVariationWidget(
                        productName: product?.categoryProductList
                                ?.product?[index].productName ??
                            "",
                        productMinPrice: product
                                ?.categoryProductList
                                ?.product?[index]
                                .variation?[0]
                                .productSalePrice ??
                            "",
                        productMaxPrice: product
                                ?.categoryProductList
                                ?.product?[index]
                                .variation
                                ?.last
                                .productSalePrice ??
                            "",
                        productId: product?.categoryProductList?.product?[index]
                                .productId ??
                            0,
                        productFeaturedImage: product
                                ?.categoryProductList
                                ?.product?[index]
                                .productImageFeaturedImageLink ??
                            "",
                        productMinRegular: product
                                ?.categoryProductList
                                ?.product?[index]
                                .variation?[0]
                                .productRegularPrice ??
                            "",
                      );
                    }
                    return ProductWidget(
                      productName: product?.categoryProductList?.product?[index]
                              .productName ??
                          "",
                      productSalePrice: product?.categoryProductList
                              ?.product?[index].productSalePrice ??
                          "",
                      productRegularPrice: product?.categoryProductList
                              ?.product?[index].productRegularPrice ??
                          "",
                      productId: product?.categoryProductList?.product?[index]
                              .productId ??
                          0,
                      productFeaturedImage: product?.categoryProductList
                              ?.product?[index].productImageFeaturedImageLink ??
                          "",
                    );
                  },
                ),
            };
          },
        ),
      ),
    );
  }
}
