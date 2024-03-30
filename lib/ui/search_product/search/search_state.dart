part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}


class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchSuccessState<T> extends SearchState {
  final T? success;

  const SearchSuccessState({required this.success});

  @override
  List<Object?> get props => [success];
}

class SearchFailureState extends SearchState {
  final String? errorMessage;

  const SearchFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class EmptyState extends SearchState {
  @override
  List<Object?> get props => [];
}
