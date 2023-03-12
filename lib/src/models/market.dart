class Market {
  final String? pricePerUnit;
  final String? originalCoinAmount;
  final String? type;
  final DateTime? matchedAt;

  Market(this.originalCoinAmount, this.pricePerUnit, this.type, this.matchedAt);

  Market.fromJson(Map<String, dynamic> json)
      : pricePerUnit = json['price_per_unit'],
        originalCoinAmount = json['original_coin_amount'],
        type = json['type'],
        matchedAt = DateTime.tryParse(json['matched_at']);
}
