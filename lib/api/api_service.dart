import 'package:flutter_assignment/model/login_model.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{
  String url ="https://reqres.in/api/";

  Future<List<Employees>> getEmployees() async {
    final res = await http.get("http://dummy.restapiexample.com/api/v1/employees");

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data.map((employees) => new Employees.fromJson(employees)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }


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
  // Future<UserModel> getUsers() async{
  //   String append = "users?page=2";
  //
  //   final response = await http.get(url+append);
  //   if(response.statusCode == 200 ){
  //     return UserModel.fromJson(json.decode(response.body));
  //   }else{
  //     throw Exception('Failed to load data');
  //   }
  // }
  final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(apiUrl);
    return json.decode(result.body)['results'];

  }

}