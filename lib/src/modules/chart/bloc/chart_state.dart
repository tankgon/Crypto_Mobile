part of 'chart_bloc.dart';

abstract class ChartState extends Equatable {
  const ChartState();
  @override
  List<Object> get props => [];
}
class ChartInitial extends ChartState {}
class ChartLoading extends ChartState {}

class ChartOrderLoaded extends ChartState {
  final OrderResponse chart;
  const ChartOrderLoaded(this.chart);
}

class ChartDataLoaded extends ChartState {
  final ListOrderResponse data;
  const ChartDataLoaded(this.data);
}

class ChartMarketLoaded extends ChartState {
  final MarketReponse market;
  const ChartMarketLoaded(this.market);
}

class ChartError extends ChartState {
  final String message;
  const ChartError(this.message);
}
