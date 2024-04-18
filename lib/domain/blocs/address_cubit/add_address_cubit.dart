import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/app_network_call.dart';
import '../../models/address/address_input.dart';

class AddAddressCubit extends Cubit<FormStateApi> {
  AddAddressCubit()
      : super(
          const FormStateApi(
            formLoadingState: FormLoadingState.idle,
          ),
        );

  Future<void> addShippingAddress({required AddressInput addressInput}) async {
    try {
      emit(state.copyWith(formLoadingState: FormLoadingState.loading ,errorMessage: ""));
      Map<String, dynamic> response =
          await AppNetworkCall.addAddress(addressInput: addressInput);
      emit(state.copyWith(
        formLoadingState: FormLoadingState.success,
        errorMessage: response["Message"]
      ));
    } catch (e) {
      emit(state.copyWith(
        formLoadingState: FormLoadingState.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
