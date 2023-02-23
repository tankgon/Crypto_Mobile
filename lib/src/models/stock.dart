import 'package:movie_flutter/src/models/session_reponse.dart';

class Stock extends SessionResData {
  final String id;
  final String symbol;
  final String name;

  Stock(this.id, this.name, this.symbol)
      : super(
            ceilPrice: '',
            floorPrice: '',
            refPrice: '',
            totalVolume: '',
            highestPrice: '',
            lowestPrice: '');

  Stock.fromJson(Map<String, dynamic> json)
      : id = json['stock_id'],
        symbol = json['symbol'],
        name = json['name'];
}
