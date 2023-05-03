import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/api/crypto_repository.dart';
import '../../../models/assets_response.dart';
part 'deal_event.dart';
part 'deal_state.dart';

class DealBloc extends Bloc<DealEvent, DealState> {
  DealBloc() : super(DealInitial()) {
    final CryptoRepository repository = CryptoRepository();
    on<PostWithdraw>((event, emit) async {
      try {
        emit(DealLoading());
        await repository.postWithdraw(event.amount);

        final walletList = await repository.getAssets();
        emit(DealLoaded(walletList));
        
      } on NetworkAssetBundle {
        rethrow;
      }
    });
  }
}
