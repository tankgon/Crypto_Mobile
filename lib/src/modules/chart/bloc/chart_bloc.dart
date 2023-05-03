// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:movie_flutter/src/models/list_order_response.dart';
import 'package:movie_flutter/src/models/order_response.dart';
import '../../../config/api/crypto_repository.dart';
import '../../../models/market_response.dart';
part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartInitial()) {
    final CryptoRepository repository = CryptoRepository();

    on<GetOrderSaleList>((event, emit) async {
      try {
        emit(ChartLoading());
        final stockList = await repository.getOrder(event.symbol, event.type);
        emit(ChartOrderLoaded(stockList));
        if (stockList.error != '') {
          emit(ChartError(stockList.error));
        }
      } on NetworkAssetBundle {
        rethrow;
      }
    });

    on<GetOrderList>((event, emit) async {
      try {
        emit(ChartLoading());
        final stockList = await repository.getListOrder(event.symbol);
        emit(ChartDataLoaded(stockList));
        if (stockList.error != '') {
          emit(ChartError(stockList.error));
        }
      } on NetworkAssetBundle {
        rethrow;
      }
    });

    on<GetHistoryList>((event, emit) async {
      try {
        emit(ChartLoading());
        final stockList = await repository.getHistory(event.history);
        emit(ChartDataLoaded(stockList));
        if (stockList.error != '') {
          emit(ChartError(stockList.error));
        }
      } on NetworkAssetBundle {
        rethrow;
      }
    });

    on<GetMarketList>((event, emit) async {
      try {
        emit(ChartLoading());
        final stockList = await repository.getMarket(event.market);
        emit(ChartMarketLoaded(stockList));
        if (stockList.error != '') {
          emit(ChartError(stockList.error));
        }
      } on NetworkAssetBundle {
        rethrow;
      }
    });

    // on<PostCancleOrder>((event, emit) async {
    //   try {
    //     final data = await repository.postCancleOrder(event.id);
    //     emit(ChartLoading());
    //     emit(ChartDataLoaded(data));
    //   } on NetworkAssetBundle {
    //     rethrow;
    //   }
    // });
  }
}
