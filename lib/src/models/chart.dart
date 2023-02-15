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
    ChartSampleData(
        x: DateTime(2023, 1, 2),
        open: 95.12,
        high: 36.12,
        low: 14.10,
        close: 35.50),
    ChartSampleData(
        x: DateTime(2023, 1, 3),
        open: 05.12,
        high: 96.12,
        low: 04.10,
        close: 85.50),
    ChartSampleData(
        x: DateTime(2023, 1, 4),
        open: 66.12,
        high: 17.12,
        low: 15.10,
        close: 26.50),
    ChartSampleData(
        x: DateTime(2023, 1, 5),
        open: 14.12,
        high: 25.12,
        low: 13.10,
        close: 24.50),
    ChartSampleData(
        x: DateTime(2023, 1, 6),
        open: 95.12,
        high: 36.12,
        low: 14.10,
        close: 35.50),
    ChartSampleData(
        x: DateTime(2023, 1, 7),
        open: 05.12,
        high: 96.12,
        low: 04.10,
        close: 85.50),
    ChartSampleData(
        x: DateTime(2023, 1, 8),
        open: 66.12,
        high: 17.12,
        low: 15.10,
        close: 26.50),
    ChartSampleData(
        x: DateTime(2023, 1, 9),
        open: 14.12,
        high: 25.12,
        low: 13.10,
        close: 24.50),
    ChartSampleData(
        x: DateTime(2023, 1, 10),
        open: 95.12,
        high: 36.12,
        low: 14.10,
        close: 35.50),
    ChartSampleData(
        x: DateTime(2023, 1, 11),
        open: 05.12,
        high: 96.12,
        low: 04.10,
        close: 85.50),
    ChartSampleData(
        x: DateTime(2023, 1, 12),
        open: 66.12,
        high: 17.12,
        low: 15.10,
        close: 26.50),
  ];
}
