part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();
  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  final AssetsResponse wallet;
  const WalletLoaded(this.wallet);
}

class WalletError extends WalletState {
  final String message;
  const WalletError(this.message);
}
