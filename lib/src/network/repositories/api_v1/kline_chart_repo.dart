import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movie_flutter/src/network/models/response/get_kLineChart_report.dart';
import 'package:movie_flutter/src/network/repositories/api_v1/api_repo.dart';

class KLineChartRepoImpl implements KLineChartRepo {
  KLineChartRepoImpl();
  final logger = Logger();
  static String baseUrl = "https://stock-be.fly.dev";
  final Dio _dio = Dio()
    ..options = BaseOptions(headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    });

  @override
  Future<KLineChartRes> getKLineChartReport({String path = ""}) async {
    try {
      final Response response =
          await _dio.get("$baseUrl/api/v1/kLineChart?symbol=$path");
      final object = KLineChartRes.fromJson(response.data);
      return object;
    } catch (e) {
      rethrow;
    }
  }
}
