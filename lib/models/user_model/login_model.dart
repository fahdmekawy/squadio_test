import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()

class LoginModel{
  String? email;
  String? password;
  String? message;

  LoginModel({this.email, this.password, this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

}