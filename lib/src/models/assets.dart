class Assest {
  final String? name;
  final String? symbol;
  final String? freeAsset;
  final String? lockedAsset;

  Assest(this.name, this.symbol, this.freeAsset, this.lockedAsset);

  Assest.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        symbol = json['symbol'],
        freeAsset = json['free_asset'],
        lockedAsset = json['locked_asset'];
}
