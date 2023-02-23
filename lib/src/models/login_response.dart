import 'dart:convert';

class LoginRes {
  final int? code;
  final bool? success;
  final LoginResData? data;
  LoginRes({
    this.code,
    this.success,
    this.data,
  });

  LoginRes copyWith({
    int? code,
    bool? success,
    LoginResData? data,
  }) {
    return LoginRes(
      code: code ?? this.code,
      success: success ?? this.success,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'success': success,
      'data': data?.toMap(),
    };
  }

  factory LoginRes.fromMap(Map<String, dynamic> map) {
    return LoginRes(
      code: map['code'] != null ? map['code'] as int : null,
      success: map['success'] != null ? map['success'] as bool : null,
      data: map['data'] != null
          ? LoginResData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  bool operator ==(covariant LoginRes other) {
    if (identical(this, other)) return true;
    return other.code == code && other.success == success && other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ success.hashCode ^ data.hashCode;
}

class LoginResData {
  final String? userId;
  final String? username;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? identificationNumber;
  final DateTime? birthday;
  final String? token;
  LoginResData({
    this.userId,
    this.username,
    this.name,
    this.phoneNumber,
    this.address,
    this.identificationNumber,
    this.birthday,
    this.token,
  });

  LoginResData copyWith({
    String? userId,
    String? username,
    String? name,
    String? phoneNumber,
    String? address,
    String? identificationNumber,
    DateTime? birthday,
    String? token,
  }) {
    return LoginResData(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      identificationNumber: identificationNumber ?? this.identificationNumber,
      birthday: birthday ?? this.birthday,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'username': username,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'identification_number': identificationNumber,
      'birthday': birthday,
      'token': token,
    };
  }

  factory LoginResData.fromMap(Map<String, dynamic> map) {
    return LoginResData(
      userId: map['user_id'] != null ? map['user_id'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phoneNumber:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      identificationNumber: map['identification_number'] != null
          ? map['identification_number'] as String
          : null,
      birthday: DateTime.tryParse(map['birthday'] ?? ""),
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResData.fromJson(String source) =>
      LoginResData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginResData(userId: $userId, username: $username, name: $name, phoneNumber: $phoneNumber, address: $address, identificationNumber: $identificationNumber, birthday: $birthday, token: $token)';
  }

  @override
  bool operator ==(covariant LoginResData other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.username == username &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.identificationNumber == identificationNumber &&
        other.birthday == birthday &&
        other.token == token;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        username.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        identificationNumber.hashCode ^
        birthday.hashCode ^
        token.hashCode;
  }
}
