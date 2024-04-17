import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:agriapp/domain/models/order/order_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../../../domain/blocs/order/order_response.dart';

class CreateOrderCubit extends Cubit<FormStateApi> {

  CreateOrderCubit()
      : super(
          const FormStateApi(
            formLoadingState: FormLoadingState.idle,
          ),
        );

  Future<void> placeOrder({required OrderInput orderInput}) async {
    emit(
      state.copyWith(
        formLoadingState: FormLoadingState.loading,
      ),
    );
    try {
      OrderCreateResponse createResponse = await ProductNetworkModule.createOrder(
        orderInput: orderInput,
      );

      emit(
        state.copyWith(
          formLoadingState: FormLoadingState.success,
          success: createResponse,
          errorMessage: createResponse.messege ?? ""
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          formLoadingState: FormLoadingState.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
