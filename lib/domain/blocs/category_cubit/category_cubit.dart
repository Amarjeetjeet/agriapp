import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../../domain/models/category/category_list_response.dart';
import '../../models/category/sub_category_list.dart';
import '../../models/product/prodct_by_category_response.dart';
import '../state_api/state_api.dart';

class CategoryCubit extends Cubit<StateApi> {
  CategoryCubit() : super(LoadingState());

  Future<void> allCategory() async {
    try {
      CategoryListResponse categoryListResponse =
          await ProductNetworkModule.allCategory();

      if ((categoryListResponse.productCategries?.category ?? []).isEmpty) {
        emit(EmptyState());
        return;
      }
      emit(SuccessState(success: categoryListResponse));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> productByCategory({required int categoryId}) async {
    try {
      CategoryByProduct categoryByProduct =
          await ProductNetworkModule.productByCategory(categoryId: categoryId);

      if ((categoryByProduct.categoryProductList?.product ?? []).isEmpty) {
        emit(EmptyState());
        return;
      }
      emit(SuccessState(success: categoryByProduct));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> subCategory({required int categoryId}) async {
    try {
      SubCategoryListResponse subCategoryListResponse =
          await ProductNetworkModule.subCategory(
        categoryId: categoryId,
      );

      if ((subCategoryListResponse.productSubCategories?.category ?? [])
          .isEmpty) {
        emit(EmptyState());
        return;
      }
      emit(SuccessState(success: subCategoryListResponse));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
