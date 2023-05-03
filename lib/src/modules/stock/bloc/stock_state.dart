part of 'stock_bloc.dart';

abstract class StockState extends Equatable {
  const StockState();
  @override
  List<Object> get props => [];
}
class StockInitial extends StockState {}
class StockLoading extends StockState {}
class StockLoaded extends StockState {
  final StockResponse stock;
  const StockLoaded(this.stock);
}

class StockError extends StockState {
  final String message;
  const StockError(this.message);
}
