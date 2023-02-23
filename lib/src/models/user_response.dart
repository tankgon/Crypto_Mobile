import 'package:movie_flutter/src/models/user.dart';

class UserResponse {
  final List<User> user;
  final String error;

  UserResponse(this.user, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : user = (json as List).map((e) => User.fromJson(e)).toList(),
        error = "";

  UserResponse.withError(String errorValue)
      : user = List.empty(),
        error = errorValue;
}
