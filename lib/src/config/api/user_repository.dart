import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:movie_flutter/src/models/login_response.dart';
import 'package:movie_flutter/src/modules/signin/signin_page.dart';
import '../../modules/home/home_page.dart';

class UserRepository {
  static String mainUrl = "https://stock-be.fly.dev";
  final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: mainUrl, headers: {
      "Content-Type": "application/json",
    });
  var postLoginUrl = '$mainUrl/api/v1/auth/login';
  var postRegisterUrl = '$mainUrl/api/v1/auth/register';
  var logger = Logger();

  UserRepository._internal();
  String? dataToken;

  static final UserRepository instance = UserRepository._internal();
  factory UserRepository() => instance;

  Future<String?> postLogin(String email, String password) async {
    var data = {"username": email, "password": password};
    try {
      final response = await _dio.post(postLoginUrl, data: data);
      final res = LoginRes.fromMap(response.data);
      Get.to(() => HomePage(loginResData: res.data));
      dataToken = res.data?.token;
    } catch (error) {
      Get.offAll(() => const SignInPage());
    }
    return null;
  }

  Future<void> postRegister(
      String? username,
      String? password,
      String? fullName,
      String? address,
      double? phoneNumber,
      String? identificationNumber,
      String? birthday) async {
    var data = {
      "username": username,
      "password": password,
      "fullName": fullName,
      "address": address,
      "phoneNumber": phoneNumber,
      "identificationNumber": identificationNumber,
      "birthday": birthday,
    };
    try {
      await _dio.post(postRegisterUrl, data: data);
      Get.to(() => const SignInPage());
    } catch (error) {
      rethrow;
    }
  }
}
