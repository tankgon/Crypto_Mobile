import 'package:movie_flutter/src/network/models/response/get_current_report_res.dart';
import '../../models/response/get_kLineChart_report.dart';

abstract class SessionsRepo {
  Future<GetCurrentReportRes?> getCurrentReport({String path = ""});
}

abstract class KLineChartRepo {
  Future<KLineChartRes?> getKLineChartReport({String path = ""});
}
