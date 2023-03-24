import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:logger/logger.dart';
import 'package:movie_flutter/src/config/api/user_repository.dart';
import 'package:movie_flutter/src/models/assets_response.dart';
import 'package:movie_flutter/src/models/list_order_response.dart';
import 'package:movie_flutter/src/models/market_response.dart';
import 'package:movie_flutter/src/models/order_response.dart';
import 'package:movie_flutter/src/models/stock_response.dart';
import 'package:movie_flutter/src/modules/home/home_page.dart';

class CryptoRepository {
  static String mainUrl = "https://stock-be.fly.dev";

  final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: mainUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'withCredentials': true,
      "Authorization": "Bearer ${UserRepository().dataToken}"
    });

  //get
  var getStockUrl = '$mainUrl/api/v1/stocks';
  var getSessionUrl = '$mainUrl/api/v1/sessions/currentReport';
  var getOrderResponseUrl = '$mainUrl/api/v1/orders';
  var getListOrderResponseUrl = '$mainUrl/api/v1/orders/enabled';
  var getMarketUrl = '$mainUrl/api/v1/orders/historyMatched';
  var getHistoryUrl = '$mainUrl/api/v1/orders/history';
  var getAssetsUrl = '$mainUrl/api/v1/assets';
  //post
  var postCancleOrderUrl = '$mainUrl/api/v1/orders/cancel';
  var postCreateOrderUrl = '$mainUrl/api/v1/orders';
  var postdepositUrl = '$mainUrl/api/v1/assets/deposit';
  var postWithdrawUrl = '$mainUrl/api/v1/assets/withdraw';

  var logger = Logger();

  Future<StockResponse> getStock() async {
    print('thanhne ${UserRepository().dataToken}');
    var params = {"language": "en-US"};
    try {
      Response response = await _dio.get(getStockUrl, queryParameters: params);
      return StockResponse.fromJson(response.data);
    } catch (error) {
      return StockResponse.withError("$error");
    }
  }

  Future<OrderResponse> getOrder(String? symbol, String? type) async {
    try {
      Response response = await _dio
          .get("$getOrderResponseUrl?type=$type&symbol=$symbol&limit=10");
      return OrderResponse.fromJson(response.data);
    } catch (error) {
      return OrderResponse.withError("$error");
    }
  }

  Future<ListOrderResponse> getListOrder(String? symbol) async {
    try {
      Response response =
          await _dio.get('$getListOrderResponseUrl?symbol=$symbol');
      return ListOrderResponse.fromJson(response.data);
    } catch (error) {
      return ListOrderResponse.withError("$error");
    }
  }

  Future<MarketReponse> getMarket(String? symbol) async {
    try {
      Response response = await _dio.get('$getMarketUrl?symbol=$symbol');
      return MarketReponse.fromJson(response.data);
    } catch (error) {
      return MarketReponse.withError("$error");
    }
  }

  Future<ListOrderResponse> getHistory(String? symbol) async {
    try {
      Response response = await _dio.get('$getHistoryUrl?symbol=$symbol');
      return ListOrderResponse.fromJson(response.data);
    } catch (error) {
      return ListOrderResponse.withError("$error");
    }
  }

  Future<void> postCancleOrder(String? id) async {
    var data = {"orderId": id};
    await _dio.post(postCancleOrderUrl, data: data);
  }

  Future<void> postCreateOrderBid(
      String? symbol, int? price, int? amount) async {
    var data = {
      "price": price,
      "amount": amount,
      "type": "bid",
      "symbol": symbol,
    };
    await _dio.post(postCreateOrderUrl, data: data);
  }

  Future<void> postCreateOrderAsk(
      String? symbol, int? price, int? amount) async {
    var data = {
      "price": price,
      "amount": amount,
      "type": "ask",
      "symbol": symbol,
    };
    await _dio.post(postCreateOrderUrl, data: data);
  }

  Future<AssetsResponse> getAssets() async {
    try {
      Response response = await _dio.get(getAssetsUrl);
      return AssetsResponse.fromJson(response.data);
    } catch (error) {
      return AssetsResponse.withError("$error");
    }
  }

  Future<void> postdeposit(int? amount) async {
    var data = {"amount": amount};
    try {
      await _dio.post(postdepositUrl, data: data);
      Get.to(() => const HomePage());
    } catch (error) {
      rethrow;
    }
  }

  Future<void> postWithdraw(int? amount) async {
    var data = {"amount": amount};
    try {
      await _dio.post(postWithdrawUrl, data: data);
      Get.to(() => const HomePage());
    } catch (error) {
      rethrow;
    }
  }
}
