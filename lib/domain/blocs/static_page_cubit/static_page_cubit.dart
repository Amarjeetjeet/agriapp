import 'package:agriapp/data/data_source/network/network_calls/app_network_call.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaticPageCubit extends Cubit<StateApi> {
  StaticPageCubit() : super(LoadingState());

  Future<void> getContactUs() async {
    try {
      Map<String, dynamic> res = await AppNetworkCall.contactUs();
      emit(SuccessState(success: res));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getTermAndCondition() async {
    try {
      Map<String, dynamic> res = await AppNetworkCall.getTermAndCondition();
      emit(SuccessState(success: res));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> aboutUs() async {
    try {
      Map<String, dynamic> res = await AppNetworkCall.aboutUs();
      emit(SuccessState(success: res));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
