import 'package:agriapp/ui/dashboard/product_details/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/helper/barrel.dart';
import '../../../../domain/blocs/category_cubit/category_cubit.dart';
import '../../../../domain/blocs/state_api/state_api.dart';
import '../../../../domain/models/product/prodct_by_category_response.dart';

class CategoryWiseProducts extends StatelessWidget {
  const CategoryWiseProducts({super.key, this.categoryName,required this.categoryId});

  final String? categoryName;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit()..productByCategory(categoryId: categoryId),
      child: AppScaffold(
        appBar: CustomAppBar(
          suffixIcon: Icons.shopping_cart_outlined,
          title: categoryName ?? "",
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
                  itemCount: (state.success as List<dynamic>).length,
                  itemBuilder: (context, index) {
                    CategoryByProduct? product =
                        (state.success as List<dynamic>)[index];
                    return ProductWidget(
                      productName: product?.postTitle,
                      productSalePrice: '110',
                      productRegularPrice: '1110',
                      productId: product?.iD,
                      productFeaturedImage:
                          "https://agripari.com/wp-content/uploads/2023/04/INDO-US-ASH-GOURD-9999-F1-HY.jpeg",
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
