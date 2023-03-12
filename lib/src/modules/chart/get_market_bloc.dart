import 'package:movie_flutter/src/models/market_response.dart';
import 'package:rxdart/rxdart.dart';
import '../../config/api/crypto_repository.dart';

class MarketBloc {
  final CryptoRepository _repository = CryptoRepository();
  final BehaviorSubject<MarketReponse> _subject =
      BehaviorSubject<MarketReponse>();

  getMarket(String? symbol) async {
    MarketReponse response = await _repository.getMarket(symbol);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MarketReponse> get subject => _subject;
}

final marketBloc = MarketBloc();
