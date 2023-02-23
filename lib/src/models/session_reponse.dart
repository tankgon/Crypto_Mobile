import 'dart:convert';

class SessionRes {
  final int? code;
  final bool? success;
  final SessionResData? data;
  SessionRes({
    this.code,
    this.success,
    this.data,
  });

  SessionRes copyWith({
    int? code,
    bool? success,
    SessionResData? data,
  }) {
    return SessionRes(
      code: code ?? this.code,
      success: success ?? this.success,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'success': success,
      'data': data?.toMap(),
    };
  }

  factory SessionRes.fromMap(Map<String, dynamic> map) {
    return SessionRes(
      code: map['code'] != null ? map['code'] as int : null,
      success: map['success'] != null ? map['success'] as bool : null,
      data: map['data'] != null
          ? SessionResData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  bool operator ==(covariant SessionRes other) {
    if (identical(this, other)) return true;
    return other.code == code && other.success == success && other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ success.hashCode ^ data.hashCode;
}

class SessionResData {
  final String? ceilPrice;
  final String? floorPrice;
  final String? refPrice;
  final String? totalVolume;
  final String? highestPrice;
  final String? lowestPrice;
  SessionResData({
    this.ceilPrice,
    this.floorPrice,
    this.refPrice,
    this.totalVolume,
    this.highestPrice,
    this.lowestPrice,
  });

  SessionResData copyWith({
    String? ceilPrice,
    String? floorPrice,
    String? refPrice,
    String? totalVolume,
    String? highestPrice,
    String? lowestPrice,
  }) {
    return SessionResData(
      ceilPrice: ceilPrice ?? this.ceilPrice,
      floorPrice: floorPrice ?? this.floorPrice,
      refPrice: refPrice ?? this.refPrice,
      totalVolume: totalVolume ?? this.totalVolume,
      highestPrice: highestPrice ?? this.highestPrice,
      lowestPrice: lowestPrice ?? this.lowestPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ceil_price': ceilPrice,
      'floor_price': floorPrice,
      'ref_price': refPrice,
      'total_volume': totalVolume,
      'highest_price': highestPrice,
      'lowest_price': lowestPrice,
    };
  }

  factory SessionResData.fromMap(Map<String, dynamic> map) {
    return SessionResData(
      ceilPrice: map['ceil_price'] != null ? map['ceil_price'] as String : null,
      floorPrice:
          map['floor_price'] != null ? map['floor_price'] as String : null,
      refPrice: map['ref_price'] != null ? map['ref_price'] as String : null,
      totalVolume:
          map['total_volume'] != null ? map['total_volume'] as String : null,
      highestPrice:
          map['highest_price'] != null ? map['highest_price'] as String : null,
      lowestPrice:
          map['lowest_price'] != null ? map['lowest_price'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionResData.fromJson(String source) =>
      SessionResData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SessionResData(ceilPrice: $ceilPrice, floorPrice: $floorPrice, refPrice: $refPrice, totalVolume: $totalVolume, highestPrice: $highestPrice, lowestPrice: $lowestPrice)';
  }

  @override
  bool operator ==(covariant SessionResData other) {
    if (identical(this, other)) return true;

    return other.ceilPrice == ceilPrice &&
        other.floorPrice == floorPrice &&
        other.refPrice == refPrice &&
        other.totalVolume == totalVolume &&
        other.highestPrice == highestPrice &&
        other.lowestPrice == lowestPrice;
  }

  @override
  int get hashCode {
    return ceilPrice.hashCode ^
        floorPrice.hashCode ^
        refPrice.hashCode ^
        totalVolume.hashCode ^
        highestPrice.hashCode ^
        lowestPrice.hashCode;
  }
}
