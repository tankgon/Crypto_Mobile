// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:movie_flutter/src/models/stock_response.dart';
import '../../../config/api/crypto_repository.dart';
part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    final CryptoRepository repository = CryptoRepository();
    on<GetStockList>((event, emit) async {
      try {
        emit(StockLoading());
        final stockList = await repository.getStock();
        emit(StockLoaded(stockList));
        if (stockList.error != '') {
          emit(StockError(stockList.error));
        }
      } on NetworkAssetBundle {
        rethrow;
      }
    });
  }
}
