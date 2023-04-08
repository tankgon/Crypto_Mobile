// ignore_for_file: unused_field

import 'package:dio/dio.dart';

class DioConfig {
  static String mainUrl = "https://stock-be.fly.dev";
  final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: mainUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'withCredentials': true,
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlcl80IiwidXNlcm5hbWUiOiJ0aGFuaG5lMSIsImlhdCI6MTY3ODUwNzU1OCwiZXhwIjoxNjg2MjgzNTU4fQ.qvdBBifi6kGNkSC4mIixFCypntIkFVmfOMXBBlRsrl8"
    });
}
