import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  int? status;
  String? message;
  Customer? customer;
  Contacts? contacts;

  LoginResponse({this.status, this.message, this.customer, this.contacts});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class Customer {
  String? id;
  String? name;
  int? numOfNotfications;

  Customer({this.id, this.name, this.numOfNotfications});
  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@JsonSerializable()
class Contacts {
  String? phone;
  String? email;
  String? link;

  Contacts({this.phone, this.email, this.link});
  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);
}
