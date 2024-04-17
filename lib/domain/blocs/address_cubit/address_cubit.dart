import 'package:agriapp/data/data_source/network/network_calls/app_network_call.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:agriapp/domain/models/model/shipping_address_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/address/address_input.dart';

class AddressCubit extends Cubit<StateApi> {
  AddressCubit() : super(LoadingState());

  Future<void> getShippingAddress() async {
    try {
      ShippingAddressResponse shippingAddressResponse =
          await AppNetworkCall.shippingAddress();

      if ((shippingAddressResponse.userBillingAddress?.billingAddress1 ?? "")
          .isEmpty) {
        return emit(EmptyState());
      }
      emit(SuccessState(success: shippingAddressResponse));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

  Future<void> addShippingAddress({required AddressInput addressInput}) async {
    try {
      Map<String, dynamic> response =
          await AppNetworkCall.addAddress(addressInput: addressInput);

      if (true) {
        return emit(EmptyState());
      }
      emit(SuccessState(success: response));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
