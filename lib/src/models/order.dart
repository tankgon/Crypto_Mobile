class Order {
  final String coinAmount;
  final String pricePerUnit;

  Order(this.coinAmount, this.pricePerUnit);

  Order.fromJson(Map<String, dynamic> json)
      : coinAmount = json['coin_amount'],
        pricePerUnit = json['price_per_unit'];
}