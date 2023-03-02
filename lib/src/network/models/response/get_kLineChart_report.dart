class KLineChartRes {
  KLineChartRes({
    required this.code,
    required this.charts,
    required this.success,
  });

  final int? code;
  final bool? success;
  final List<KLineChartResData> charts;

  factory KLineChartRes.fromJson(Map<String, dynamic> json) => KLineChartRes(
        code: json["code"],
        charts: (json["data"]["charts"] as List)
            .map((i) => KLineChartResData.fromJson(i))
            .toList(),
        success: json["success"],
      );
}

class KLineChartResData {
  KLineChartResData({
    required this.x,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });

  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;

  factory KLineChartResData.fromJson(Map<String, dynamic> json) =>
      KLineChartResData(
        x: DateTime.tryParse(json['close_time'] ?? ""),
        open: num.tryParse(json["open_price"] ?? ""),
        close: num.tryParse(json["close_price"] ?? ""),
        high: num.tryParse(json["highest_price"] ?? ""),
        low: num.tryParse(json["lowest_price"] ?? ""),
      );
}
