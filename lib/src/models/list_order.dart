class ListOrder {
  final String? orderId;
  final String? pricePerUnit;
  final String? coinAmount;
  final String? originalCoinAmount;
  final String? type;
  final String? state;
  final DateTime? createdAt;

  ListOrder(this.coinAmount, this.createdAt, this.orderId,
      this.originalCoinAmount, this.pricePerUnit, this.state, this.type);

  ListOrder.fromJson(Map<String, dynamic> json)
      : orderId = json['order_id'],
        pricePerUnit = json['price_per_unit'],
        coinAmount = json['coin_amount'],
        originalCoinAmount = json['original_coin_amount'],
        type = json['type'],
        state = json['state'],
        createdAt = DateTime.tryParse(json['created_at']);
}
