import 'package:agriapp/data/helper/barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../domain/blocs/category_cubit/category_cubit.dart';
import '../../../../domain/blocs/state_api/state_api.dart';
import '../../../../domain/models/category/category_list_response.dart';
import '../../category/category_list_all/category_list_all.dart';
import '../../category/category_wise_product/category_wise_products.dart';
import 'header_with_button.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, StateApi>(
      builder: (context, state) {
        return switch (state) {
          LoadingState() => const Padding(
              padding: EdgeInsets.all(8.0),
              child: Loader(),
            ),
          SuccessState() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                1.3.h.height(),
                HeaderWithButton(
                  title: 'Category',
                  btnText: 'See All',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CategoryListAll(
                          categoryListResponse:
                              (state.success as CategoryListResponse),
                        ),
                      ),
                    );
                  },
                ),
                1.h.height(),
                Container(
                  height: 20.h,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: (state.success as CategoryListResponse)
                        .productCategries
                        ?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) {
                      ProductCategries? productCategory =
                          (state.success as CategoryListResponse)
                              .productCategries?[i];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoryWiseProducts(
                                  categoryId: productCategory?.catID ?? 0,
                                  categoryName: productCategory?.catName,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton.outlined(
                                onPressed: null,
                                style: IconButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.all(16.0),
                                  side: BorderSide(
                                    width: 1,
                                    color: cD9D9D9,
                                  ),
                                ),
                                icon: Image.asset(
                                  catImg,
                                  width: 40,
                                ),
                              ),
                              1.h.height(),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  productCategory?.catName ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          FailureState() => const SizedBox(),
          EmptyState() => const SizedBox(),
        };
      },
    );
  }
}
