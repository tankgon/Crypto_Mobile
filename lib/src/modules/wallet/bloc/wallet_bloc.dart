// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:movie_flutter/src/models/assets_response.dart';
import '../../../config/api/crypto_repository.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    final CryptoRepository repository = CryptoRepository();
    on<GetWalletList>((event, emit) async {
      try {
        emit(WalletLoading());
        final walletList = await repository.getAssets();
        emit(WalletLoaded(walletList));
        if (walletList.error != '') {
          emit(WalletError(walletList.error));
        }
      } on NetworkAssetBundle {
        rethrow;
      }
    });
  }
}
