import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movie_flutter/src/models/login_response.dart';

class UserRepository {
  static String mainUrl = "https://stock-be.fly.dev";
  final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: mainUrl, headers: {
      "Content-Type": "application/json",
    });
  final String username = 'votuan';
  final String password = '123456789';
  var postLoginUrl = '$mainUrl/api/v1/auth/login';
  var logger = Logger();

  Future<LoginRes> postLogin() async {
    var data = {"username": username, "password": password};
    try {
      final response = await _dio.post(postLoginUrl, data: data);
      final res = LoginRes.fromMap(response.data);
      // print("Thanh LOG ${res.data?.token}");
      return res;
    } catch (error) {
      throw UnimplementedError();
    }
  }
}
