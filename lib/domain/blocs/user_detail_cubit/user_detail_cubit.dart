import 'package:agriapp/data/data_source/network/network_calls/app_network_call.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_details/user_details.dart';

class UserDetailCubit extends Cubit<StateApi> {
  UserDetailCubit() : super(LoadingState());

  void getUserDetails() async {
    try {
      UserDetailResponse userDetailResponse =
          await AppNetworkCall.getUserDetails();

      emit(SuccessState(success: userDetailResponse));
      return;
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
