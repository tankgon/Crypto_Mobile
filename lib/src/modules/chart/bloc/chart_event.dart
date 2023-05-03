part of 'chart_bloc.dart';

abstract class ChartEvent extends Equatable {
  const ChartEvent();
  @override
  List<Object> get props => [];
}

class GetOrderSaleList extends ChartEvent {
  final String? symbol;
  final String? type;
  const GetOrderSaleList(this.symbol, this.type);
}

class GetOrderList extends ChartEvent {
  final String? symbol;
  const GetOrderList(this.symbol);
}

class GetHistoryList extends ChartEvent {
  final String? history;
  const GetHistoryList(this.history);
}

class GetMarketList extends ChartEvent {
  final String? market;
  const GetMarketList(this.market);
}

// class PostCancleOrder extends ChartEvent {
//   final String? id;
//   const PostCancleOrder(this.id);
// }
