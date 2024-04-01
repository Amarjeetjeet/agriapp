import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../../domain/models/category/category_list_response.dart';
import '../../models/category/sub_category_list.dart';
import '../../models/product/prodct_by_category_response.dart';
import '../state_api/state_api.dart';

class CategoryCubit extends Cubit<StateApi> {
  CategoryCubit() : super(LoadingState());

  CategoryNetworkModule categoryNetworkModule = CategoryNetworkModule();

  Future<void> allCategory() async {
    try {
      CategoryListResponse categoryListResponse =
          await categoryNetworkModule.allCategory();

      if ((categoryListResponse.productCategries?.category ?? []).isEmpty) {
        return emit(EmptyState());
      }
      emit(SuccessState(success: categoryListResponse));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> productByCategory({required int categoryId}) async {
    try {
      CategoryByProduct categoryByProduct =
      await categoryNetworkModule.productByCategory(categoryId : categoryId);

      if ((categoryByProduct.categoryProductList?.product ?? []).isEmpty) {
        return emit(EmptyState());
      }
      emit(SuccessState(success: categoryByProduct));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> subCategory({required int categoryId}) async {
    try {
      SubCategoryListResponse subCategoryListResponse =
      await categoryNetworkModule.subCategory(categoryId : categoryId);

      if ((subCategoryListResponse.productCategries?.category ?? []).isEmpty) {
        return emit(EmptyState());
      }
      emit(SuccessState(success: subCategoryListResponse));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
