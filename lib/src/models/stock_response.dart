import 'package:movie_flutter/src/models/stock.dart';

class StockResponse {
  final List<Stock> stock;
  final String error;

  StockResponse(this.stock, this.error);

  StockResponse.fromJson(Map<String, dynamic> json)
      : stock = (json["data"]["stocks"] as List)
            .map((i) => Stock.fromJson(i))
            .toList(),
        error = "";

  StockResponse.withError(String errorValue)
      : stock = List.empty(),
        error = errorValue;
}
