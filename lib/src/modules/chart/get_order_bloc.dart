import 'package:rxdart/rxdart.dart';

import '../../config/api/crypto_repository.dart';
import '../../models/order_response.dart';

class OrdersBloc {
  final CryptoRepository _repository = CryptoRepository();
  final BehaviorSubject<OrderResponse> _subject =
      BehaviorSubject<OrderResponse>();

  getOrders(String? symbol, String? type) async {
    OrderResponse response = await _repository.getOrder(symbol, type);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<OrderResponse> get subject => _subject;
}

final orderBooksBlocAsk = OrdersBloc();
final orderBooksBlocBid = OrdersBloc();
