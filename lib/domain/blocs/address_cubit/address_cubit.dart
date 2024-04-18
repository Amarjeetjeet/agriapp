import 'package:agriapp/data/data_source/network/network_calls/app_network_call.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:agriapp/domain/models/model/shipping_address_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/address/address_input.dart';

class AddressCubit extends Cubit<StateApi> {
  AddressCubit() : super(EmptyState());

  Future<void> getBillingAddress() async {
    try {
      emit(LoadingState());
      ShippingAddressResponse shippingAddressResponse =
          await AppNetworkCall.billingAddress();

      if ((shippingAddressResponse.userBillingAddress?.billingAddress1 ?? "")
          .isEmpty) {
         emit(EmptyState());
         return;
      }
      emit(SuccessState(success: shippingAddressResponse));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }

}
