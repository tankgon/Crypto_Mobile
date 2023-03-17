import 'package:movie_flutter/src/models/assets.dart';

class AssetsResponse {
  final List<Assest> listAssest;
  final String error;

  AssetsResponse(this.listAssest, this.error);

  AssetsResponse.fromJson(Map<String, dynamic> json)
      : listAssest = (json["data"]["assets"] as List)
            .map((i) => Assest.fromJson(i))
            .toList(),
        error = "";

  AssetsResponse.withError(String errorValue)
      : listAssest = List.empty(),
        error = errorValue;
}
