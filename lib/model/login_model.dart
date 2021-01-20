import 'dart:convert';
import 'file:///D:/FlutterProjects/flutter_assignment/lib/ui/signup.dart';

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});


  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",);
  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = {
      'token': token.trim(),
      'error':error.trim()
    };
    return map;
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