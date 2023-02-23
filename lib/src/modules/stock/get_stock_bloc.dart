import 'package:rxdart/rxdart.dart';
import '../../config/api/crypto_repository.dart';
import '../../models/stock_response.dart';

class StockListBloc {
  final CryptoRepository _repository = CryptoRepository();
  final BehaviorSubject<StockResponse> _subject =
      BehaviorSubject<StockResponse>();

  getStocks() async {
    StockResponse response = await _repository.getStock();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<StockResponse> get subject => _subject;
}

final stocksBloc = StockListBloc();
