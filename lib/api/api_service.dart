import 'package:flutter_assignment/model/login_model.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{
  String url ="https://reqres.in/api/";


Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async{
  String append = "login";

  // String url ="https://reqres.in/api/login";
  // String url ="http://staging.php-dev.in:8844/trainingapp/api/users/login";
  final response = await http.post(url + append,body: loginRequestModel.toJson());
  if(response.statusCode == 200 || response.statusCode ==400){
    return LoginResponseModel.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load data');
  }
}
  Future<UserModel> getUsers() async{
    String append = "users?page=2";

    final response = await http.get(url+append);
    if(response.statusCode == 200 ){
      return UserModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load data');
    }
  }

}