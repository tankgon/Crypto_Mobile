import 'package:movie_flutter/src/models/order.dart';

class OrderResponse {
  final List<Order> order;
  final String error;

  OrderResponse(this.order, this.error);

  OrderResponse.fromJson(Map<String, dynamic> json)
      : order = (json["data"]["orders"] as List)
            .map((i) => Order.fromJson(i))
            .toList(),
        error = "";

  OrderResponse.withError(String errorValue)
      : order = List.empty(),
        error = errorValue;
}
