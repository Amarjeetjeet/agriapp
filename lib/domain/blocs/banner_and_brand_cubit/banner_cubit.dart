import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../models/banner_and_brand/banner_list_response.dart';
import '../../models/banner_and_brand/brand_list_response.dart';
import '../state_api/state_api.dart';

class BannerAndCompanyCubit extends Cubit<StateApi> {
  BannerAndCompanyCubit() : super(LoadingState());

  Future<void> bannerList() async {
    try {
      BannerListResponse bannerListResponse =
      await ProductNetworkModule.bannerList();

      if ((bannerListResponse.bannerList ?? []).isEmpty) {
        emit(EmptyState());
        return;
      }
      emit(SuccessState(success: bannerListResponse));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

}
