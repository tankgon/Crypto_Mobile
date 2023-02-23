import 'package:dio/dio.dart';
import 'package:movie_flutter/src/config/api/user_repository.dart';

class DioConfig {
  static String mainUrl = "https://stock-be.fly.dev";
  final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: mainUrl, headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      // 'responseType': ResponseType.json,
      "Authorization": '${UserRepository().postLogin()}',
    });
}
