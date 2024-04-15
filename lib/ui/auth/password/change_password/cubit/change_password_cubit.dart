import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/data_source/network/network_calls/auth_network_call.dart';
import '../../../../../domain/models/auth/auth_model.dart';

class ChangePasswordCubit extends Cubit<FormStateApi> {
  ChangePasswordCubit() : super(const FormStateApi());

  void changePassword({required String password}) async {
    emit(
      state.copyWith(
        formLoadingState: FormLoadingState.loading,
      ),
    );
    try {
      AuthModel changePassword = await AuthNetworkModule.changePassword(
        password: password,
      );

      if ((changePassword.status ?? false)) {
        emit(
          state.copyWith(
              formLoadingState: FormLoadingState.success,
              errorMessage: changePassword.message,
              success: changePassword),
        );
      } else {
        emit(
          state.copyWith(
            formLoadingState: FormLoadingState.failure,
            errorMessage: changePassword.message,
          ),
        );
      }
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
