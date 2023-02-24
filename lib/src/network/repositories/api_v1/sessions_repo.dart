import 'package:movie_flutter/src/network/models/response/get_current_report_res.dart';

abstract class SessionsRepo {
  Future<GetCurrentReportRes?> getCurrentReport({String path = ""});
}
