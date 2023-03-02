import 'package:dio/dio.dart';
import 'package:movie_flutter/src/network/models/response/get_current_report_res.dart';
import 'package:movie_flutter/src/network/repositories/api_v1/api_repo.dart';

class SesionsRepoImpl implements SessionsRepo {
  SesionsRepoImpl();
  static String baseUrl = "https://stock-be.fly.dev";
  final Dio _dio = Dio()
    ..options = BaseOptions(headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    });

  @override
  Future<GetCurrentReportRes?> getCurrentReport({String path = ""}) async {
    try {
      final Response response =
          await _dio.get("$baseUrl/api/v1/sessions/currentReport?symbol=$path");
      return GetCurrentReportRes.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
