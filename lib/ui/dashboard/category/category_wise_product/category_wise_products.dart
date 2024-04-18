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
          title: (categoryName ?? "").upCaseString,
          onBackPress: () => context.pop(),
        ),
        body: BlocBuilder<CategoryCubit, StateApi>(
          builder: (context, state) {
            return switch (state) {
              LoadingState() => const Loader(),
              FailureState() => DisplayError(errorMessage: state.errorMessage),
              EmptyState() => const EmptyList(),
              SuccessState() => buildProductGridView(state.success),
            };
          },
        ),
      ),
    );
  }

  AlignedGridView buildProductGridView(CategoryByProduct? categoryByProduct) {
    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(16),
      itemCount: (categoryByProduct?.categoryProductList?.product ?? []).length,
      itemBuilder: (context, index) {
        Product? productDetail =
            categoryByProduct?.categoryProductList?.product?[index];
        if (productDetail?.isVariationProduct ?? false) {
          return buildProductVariationWidget(productDetail);
        }
        return buildProductWidget(productDetail);
      },
    );
  }

  ProductWidget buildProductWidget(Product? productDetail) {
    return ProductWidget(
      productName: productDetail?.productName ?? "",
      productSalePrice: productDetail?.productSalePrice ?? "",
      productRegularPrice: productDetail?.productRegularPrice ?? "",
      productId: productDetail?.productId ?? 0,
      productFeaturedImage: productDetail?.productImageFeaturedImageLink ?? "",
    );
  }

  ProductVariationWidget buildProductVariationWidget(Product? productDetail) {
    return ProductVariationWidget(
      productName: productDetail?.productName ?? "",
      productMinPrice: productDetail?.variation?[0].productSalePrice ?? "",
      productMaxPrice: productDetail?.variation?.last.productSalePrice ?? "",
      productId: productDetail?.productId ?? 0,
      productFeaturedImage: productDetail?.productImageFeaturedImageLink ?? "",
      productMinRegular: productDetail?.variation?[0].productRegularPrice ?? "",
    );
  }
}
