import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/app_network_call.dart';


class CartDetailCubit extends Cubit<StateApi> {
  CartDetailCubit() : super(LoadingState());

  void getCartDetails() async {
    try {
      final userDetailResponse =
      await AppNetworkCall.getCartDetails();

      emit(SuccessState(success: userDetailResponse));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
