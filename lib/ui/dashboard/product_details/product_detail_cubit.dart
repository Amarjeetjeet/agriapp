import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../../domain/models/product/product_detail.dart';

class ProductDetailCubit extends Cubit<StateApi> {
  ProductDetailCubit() : super(LoadingState());

  Future<void> getProductDetail({required int? productId}) async {
    emit(LoadingState());
    try {
      ProductDetail? productDetails =
          await ProductNetworkModule.getProductDetail(
        productId: productId,
      );
      emit(SuccessState(success: productDetails));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
