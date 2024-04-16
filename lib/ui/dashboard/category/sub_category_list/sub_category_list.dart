import 'package:agriapp/domain/blocs/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/helper/barrel.dart';
import '../../../../domain/blocs/state_api/state_api.dart';
import '../../../../domain/models/category/sub_category_list.dart';
import '../category_wise_product/category_wise_products.dart';

class SubCategoryList extends StatelessWidget {
  const SubCategoryList({super.key, required this.categoryId, required this.categoryName});

  final int categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..subCategory(categoryId: categoryId),
      child: AppScaffold(
        appBar: CustomAppBar(
          title: (categoryName ?? "").toUpperCase().replaceAll("-", " "),
          onBackPress: () {
            Navigator.pop(context);
          },
        ),
        body: BlocBuilder<CategoryCubit, StateApi>(
          builder: (context, state) {
            return switch (state) {
              LoadingState() => const Loader(),
              FailureState() => DisplayError(
                  errorMessage: state.errorMessage,
                ),
              EmptyState() => const DisplayError(
                  errorMessage: "No result found!",
                ),
              SuccessState() => ListView.separated(
                  itemCount: ((state.success as SubCategoryListResponse)
                              .productSubCategories
                              ?.category ??
                          [])
                      .length,
                  itemBuilder: (c, i) {
                    Category? category =
                        (state.success as SubCategoryListResponse)
                            .productSubCategories
                            ?.category?[i];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CategoryWiseProducts(
                              categoryId: category?.catID ?? 0,
                              categoryName: category?.catName,
                            ),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: cD9D9D9,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          category?.image ?? "",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (c, i, s) => Image.asset(
                            catImg,
                            width: 40,
                          ),
                        ),
                      ),
                      title: Text(
                        (category?.slug ?? "").toUpperCase().replaceAll("-", " "),
                        style: txtRegularF16cBlack,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(
                        color: cEEE,
                        thickness: 2,
                      ),
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
