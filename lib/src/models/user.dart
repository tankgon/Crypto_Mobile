class User {
  final String id;
  final String userName;
  final String name;
  final String phoneNumber;
  final String address;
  final String identificationNumber;
  final String birthDay;
  final String token;

  User(this.id, this.userName, this.name, this.token, this.phoneNumber,
      this.address, this.birthDay, this.identificationNumber);

  User.fromJson(Map<String, dynamic> json)
      : id = json['user_id'],
        userName = json['username'],
        name = json['name'],
        phoneNumber = json['phone_number'],
        address = json['address'],
        birthDay = json['birthday'],
        identificationNumber = json['identification_number'],
        token = json['token'];
}
