class ChartSampleData {
  ChartSampleData({this.x, this.open, this.close, this.low, this.high});
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}

List<ChartSampleData> getChartData() {
  return <ChartSampleData>[
    ChartSampleData(
        x: DateTime(2023, 1, 1),
        open: 14.12,
        high: 25.12,
        low: 13.10,
        close: 24.50),
  ];
}
