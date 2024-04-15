import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/local/database_helper/database_helper.dart';

class CartCounterCubit extends Cubit<int> {
  late DatabaseHelper _databaseHelper;

  CartCounterCubit() : super(0) {
    _databaseHelper = DatabaseHelper();
  }

  Future<void> getQuantity({required int? productId}) async {
    int count = await _databaseHelper.getProductQuantity(productId ?? 0);
    debugPrint("The count is $count");
    emit(count);
  }
}
