import 'package:movie_flutter/src/models/assets_response.dart';
import 'package:rxdart/rxdart.dart';
import '../../config/api/crypto_repository.dart';

class AssetsBloc {
  final CryptoRepository _repository = CryptoRepository();
  final BehaviorSubject<AssetsResponse> _subject =
      BehaviorSubject<AssetsResponse>();

  // var loginForm = {};

  getAssetsUser() async {
    AssetsResponse response = await _repository.getAssets();
    _subject.sink.add(response);
    print('haha ${response.listAssest[0].freeAsset}');
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AssetsResponse> get subject => _subject;
}

final assestBloc = AssetsBloc();
