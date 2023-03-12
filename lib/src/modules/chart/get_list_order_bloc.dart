import 'package:movie_flutter/src/models/list_order_response.dart';
import 'package:rxdart/rxdart.dart';
import '../../config/api/crypto_repository.dart';

class OrdersListBloc {
  final CryptoRepository _repository = CryptoRepository();
  final BehaviorSubject<ListOrderResponse> _subject =
      BehaviorSubject<ListOrderResponse>();

  getListOrders(String? symbol) async {
    ListOrderResponse response = await _repository.getListOrder(symbol);
    _subject.sink.add(response);
  }

  getHistorys(String? symbol) async {
    ListOrderResponse response = await _repository.getHistory(symbol);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ListOrderResponse> get subject => _subject;
}

final listOrdersBloc = OrdersListBloc();
final listHistory = OrdersListBloc();
