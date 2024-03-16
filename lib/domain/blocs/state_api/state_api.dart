import 'package:equatable/equatable.dart';

sealed class StateApi extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends StateApi {}

class SuccessState<T> extends StateApi {
  final T? success;

  SuccessState({required this.success});

  @override
  List<Object?> get props => [success];
}

class FailureState extends StateApi {
  final String? errorMessage;

  FailureState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class EmptyState extends StateApi {}
