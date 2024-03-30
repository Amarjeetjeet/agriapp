import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/network/network_calls/category_network_call.dart';
import '../../../domain/models/search/search_response.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  CategoryNetworkModule categoryNetworkModule = CategoryNetworkModule();

  void searchProduct({required String keyword}) async {
    emit(SearchLoadingState());
    try {
      SearchResponse response = await categoryNetworkModule.searchProduct(
        keyword: keyword,
      );
      if ((response.searchProductList ?? []).isEmpty) {
        return emit(EmptyState());
      }
      emit(
        SearchSuccessState(success: response),
      );
    } catch (e) {
      emit(SearchFailureState(
        errorMessage: e.toString(),
      ));
    }
  }
}
