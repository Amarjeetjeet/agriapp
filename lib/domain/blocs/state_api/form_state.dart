import 'package:equatable/equatable.dart';

enum FormLoadingState { idle, loading, success, failure }

class FormStateApi<T> extends Equatable {
  const FormStateApi(
      {this.formLoadingState = FormLoadingState.idle,
      this.errorMessage = "",
      this.success});

  final FormLoadingState formLoadingState;
  final T? success;
  final String? errorMessage;

  FormStateApi copyWith({
    FormLoadingState? formLoadingState,
    T? success,
    String? errorMessage,
  }) {
    return FormStateApi(
      formLoadingState: formLoadingState ?? this.formLoadingState,
      success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        formLoadingState,
        errorMessage,
        success,
      ];
}
