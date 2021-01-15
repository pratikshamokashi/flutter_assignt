import 'dart:convert';
import 'package:flutter_assignment/signup.dart';

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});


  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",);
  }
}

class LoginRequestModel{
  String email;
  String Password;
  LoginRequestModel({
   this.email,
   this.Password
});
  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email':email.trim(),
      'password':Password.trim(),
    };
    return map;
  }
}