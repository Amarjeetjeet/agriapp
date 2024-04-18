import 'package:agriapp/data/data_source/network/network_calls/category_network_call.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<StateApi> {
  OrderCubit() : super(LoadingState());

  void getOrders() async {
    try {
      Map<String, dynamic>? orderList = await ProductNetworkModule.orderList();

      emit(SuccessState(success: orderList));
    } catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
