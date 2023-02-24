class GetCurrentReportRes {
  GetCurrentReportRes({
    required this.code,
    required this.data,
    required this.success,
  });

  final int code;
  final GetCurrentReportResData data;
  final bool success;

  factory GetCurrentReportRes.fromJson(Map<String, dynamic> json) =>
      GetCurrentReportRes(
        code: json["code"],
        data: GetCurrentReportResData.fromJson(json["data"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "success": success,
      };
}

class GetCurrentReportResData {
  GetCurrentReportResData({
    required this.ceilPrice,
    required this.floorPrice,
    required this.refPrice,
    required this.totalVolume,
    required this.highestPrice,
    required this.lowestPrice,
  });

  final String ceilPrice;
  final String floorPrice;
  final String refPrice;
  final String totalVolume;
  final String highestPrice;
  final String lowestPrice;

  factory GetCurrentReportResData.fromJson(Map<String, dynamic> json) =>
      GetCurrentReportResData(
        ceilPrice: json["ceil_price"],
        floorPrice: json["floor_price"],
        refPrice: json["ref_price"],
        totalVolume: json["total_volume"],
        highestPrice: json["highest_price"],
        lowestPrice: json["lowest_price"],
      );

  Map<String, dynamic> toJson() => {
        "ceil_price": ceilPrice,
        "floor_price": floorPrice,
        "ref_price": refPrice,
        "total_volume": totalVolume,
        "highest_price": highestPrice,
        "lowest_price": lowestPrice,
      };
}
