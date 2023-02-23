import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movie_flutter/src/models/session_reponse.dart';
import 'package:movie_flutter/src/models/stock_response.dart';

class CryptoRepository {
  static String mainUrl = "https://stock-be.fly.dev";
  final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: mainUrl, headers: {
      "Content-Type": "application/json",
      "Authorization":
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlcl8xIiwidXNlcm5hbWUiOiJ2b3R1YW4iLCJpYXQiOjE2NzcwMjgyMzksImV4cCI6MTY4NDgwNDIzOX0.JfOrmwTRCjCsgjWXL3xIMh0qBdjWg9dC90pYRgUP-RA',
    });
  var getStockUrl = '$mainUrl/api/v1/stocks';
  var getSessionUrl = '$mainUrl/api/v1/sessions/currentReport';
  var logger = Logger();

  Future<StockResponse> getStock() async {
    var params = {"language": "en-US"};
    try {
      Response response = await _dio.get(getStockUrl, queryParameters: params);
      return StockResponse.fromJson(response.data);
    } catch (error) {
      return StockResponse.withError("$error");
    }
  }

  Future<SessionRes> getSession() async {
    var params = {"language": "en-US", 'symbol': 'GON'};
    try {
      Response response =
          await _dio.get(getSessionUrl, queryParameters: params);
      print(response.data['data']);
      return SessionRes.fromMap(response.data);
    } catch (error) {
      throw UnimplementedError();
    }
  }
}
