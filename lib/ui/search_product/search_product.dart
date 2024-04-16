import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/ui/search_product/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../domain/blocs/search_cubit/search_cubit.dart';
import '../../domain/models/search/search_response.dart';
import '../dashboard/product_details/product_widget.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: const SearchAppBar(),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return switch (state) {
              SearchLoadingState() => const Loader(),
              SearchInitial() => const EmptyList(
                  message: "Search something like seeds.....",
                ),
              SearchFailureState() =>
                DisplayError(errorMessage: state.errorMessage),
              EmptyState() => const EmptyList(),
              SearchSuccessState() => AlignedGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: const EdgeInsets.all(16),
                  itemCount:
                      ((state.success as SearchResponse).searchProductList ??
                              [])
                          .length,
                  itemBuilder: (context, index) {
                    SearchResponse? product = state.success;
                    return ProductWidget(
                      productName:
                          product?.searchProductList?[index].productName ?? "",
                      productSalePrice:
                          product?.searchProductList?[index].productSalePrice ??
                              "",
                      productRegularPrice: product
                              ?.searchProductList?[index].productRegularPrice ??
                          "",
                      productId:
                          product?.searchProductList?[index].productId ?? 0,
                      productFeaturedImage: product?.searchProductList?[index]
                              .productImageFeaturedImageLink ??
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
