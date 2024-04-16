import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../../domain/models/product/featured_product_response.dart';
import '../state_api/state_api.dart';

class FeaturedProductCubit extends Cubit<StateApi> {
  FeaturedProductCubit() : super(LoadingState());

  Future<void> featuredProductList({required String productCategoryId}) async {
    try {
      FeaturedProduct featuredProduct =
          await ProductNetworkModule.featuredProduct(productCategoryId : productCategoryId);

      if ((featuredProduct.featuredCategories?.product ?? []).isEmpty) {
        emit(EmptyState());
        return;
      }
      emit(SuccessState(success: featuredProduct));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
