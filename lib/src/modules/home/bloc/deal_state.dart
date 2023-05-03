part of 'deal_bloc.dart';

@immutable
abstract class DealState extends Equatable {
  const DealState();
  @override
  List<Object> get props => [];
}

class DealInitial extends DealState {
  @override
  List<Object> get props => [];
}

class DealLoading extends DealState {
  @override
  List<Object> get props => [];
}

class DealLoaded extends DealState {
  final AssetsResponse wallet;
  const DealLoaded(this.wallet);
}

class DealError extends DealState {
  final String message;
  const DealError(this.message);
}
