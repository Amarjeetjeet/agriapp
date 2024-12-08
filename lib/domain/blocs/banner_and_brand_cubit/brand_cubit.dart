import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../models/banner_and_brand/banner_list_response.dart';
import '../../models/banner_and_brand/brand_list_response.dart';
import '../state_api/state_api.dart';

class BrandCubit extends Cubit<StateApi> {
  BrandCubit() : super(LoadingState());

  Future<void> brandList() async {
    try {
      BrandListResponse brandListResponse =
      await ProductNetworkModule.brandList();

      if ((brandListResponse.brandList ?? []).isEmpty) {
        emit(EmptyState());
        return;
      }
      emit(SuccessState(success: brandListResponse));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
