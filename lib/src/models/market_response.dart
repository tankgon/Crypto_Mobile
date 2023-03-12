import 'package:movie_flutter/src/models/market.dart';

class MarketReponse {
  final List<Market> market;
  final String error;

  MarketReponse(this.market, this.error);

  MarketReponse.fromJson(Map<String, dynamic> json)
      : market = (json["data"]["orders"] as List)
            .map((i) => Market.fromJson(i))
            .toList(),
        error = "";

  MarketReponse.withError(String errorValue)
      : market = List.empty(),
        error = errorValue;
}
