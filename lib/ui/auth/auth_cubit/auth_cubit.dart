import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/auth_network_call.dart';
import '../../../domain/blocs/state_api/form_state.dart';
import '../../../domain/models/auth/auth_model.dart';
import '../../../domain/models/auth/login_response.dart';
import '../../../domain/models/auth/register_input.dart';

class AuthCubit extends Cubit<FormStateApi> {
  AuthCubit() : super(const FormStateApi());

  AuthNetworkModule networkModule = AuthNetworkModule();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        formLoadingState: FormLoadingState.loading,
      ),
    );
    try {
      LoginResponse loginResponse = await networkModule.login(
        email: email,
        password: password,
      );

      if ((loginResponse.status ?? false)) {
        emit(
          state.copyWith(
            formLoadingState: FormLoadingState.success,
            errorMessage: loginResponse.message,
            success: loginResponse,
          ),
        );
      } else {
        emit(
          state.copyWith(
            formLoadingState: FormLoadingState.failure,
            errorMessage: loginResponse.message,
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

  Future<void> register({
    required RegisterInput registerInput,
  }) async {
    emit(
      state.copyWith(
        formLoadingState: FormLoadingState.loading,
      ),
    );
    try {
      AuthModel authModel = await networkModule.register(
        registerInput: registerInput,
      );

      if ((authModel.status ?? false)) {
        emit(
          state.copyWith(
            formLoadingState: FormLoadingState.success,
            errorMessage: authModel.message,
          ),
        );
      } else {
        emit(
          state.copyWith(
            formLoadingState: FormLoadingState.failure,
            errorMessage: authModel.message,
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

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(
      state.copyWith(
        formLoadingState: FormLoadingState.loading,
      ),
    );
    try {
      AuthModel authModel = await networkModule.forgotPassword(
        email: email,
      );

      if ((authModel.status ?? false)) {
        emit(
          state.copyWith(
            formLoadingState: FormLoadingState.success,
            errorMessage: authModel.message,
          ),
        );
      } else {
        emit(
          state.copyWith(
            formLoadingState: FormLoadingState.failure,
            errorMessage: authModel.message,
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
