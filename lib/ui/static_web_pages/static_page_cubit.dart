import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/network/network_calls/auth_network_call.dart';

class StaticPageCubit extends Cubit<StateApi> {
  StaticPageCubit() : super(LoadingState());

  Future<void> getContactUs() async {
    try {
      Map<String, dynamic> res = await AuthNetworkModule.contactUs();
      emit(SuccessState(success: res));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getTermAndCondition() async {
    try {
      Map<String, dynamic> res = await AuthNetworkModule.getTermAndCondition();
      emit(SuccessState(success: res));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> aboutUs() async {
    try {
      Map<String, dynamic> res = await AuthNetworkModule.aboutUs();
      emit(SuccessState(success: res));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
