import 'package:movie_flutter/src/models/list_order.dart';

class ListOrderResponse {
  final List<ListOrder> listOrder;
  final String error;

  ListOrderResponse(this.listOrder, this.error);

  ListOrderResponse.fromJson(Map<String, dynamic> json)
      : listOrder = (json["data"]["orders"] as List)
            .map((i) => ListOrder.fromJson(i))
            .toList(),
        error = "";

  ListOrderResponse.withError(String errorValue)
      : listOrder = List.empty(),
        error = errorValue;
}