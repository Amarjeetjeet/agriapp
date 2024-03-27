import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:agriapp/domain/models/model/shipping_address_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/address_network_call.dart';

class AddressCubit extends Cubit<StateApi> {
  AddressCubit() : super(LoadingState());

  AddressNetworkModule addressNetworkModule = AddressNetworkModule();

  Future<void> getShippingAddress() async {
    try {
      ShippingAddressResponse shippingAddressResponse =
      await addressNetworkModule.shippingAddress();

      if ((shippingAddressResponse.userBillingAddress?.billingAddress1 ?? "")
          .isEmpty) {
        return emit(EmptyState());
      }
      emit(SuccessState(success: shippingAddressResponse));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
