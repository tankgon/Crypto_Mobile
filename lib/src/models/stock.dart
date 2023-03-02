class Stock {
  final String id;
  final String symbol;
  final String name;

  Stock(this.id, this.name, this.symbol);

  Stock.fromJson(Map<String, dynamic> json)
      : id = json['stock_id'],
        symbol = json['symbol'],
        name = json['name'];
}
