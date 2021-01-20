import 'package:flutter_assignment/model/login_model.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' show Client;

class ApiService{

  final String baseUrl = "http://api.bengkelrobot.net:8001";
  Client client = Client();

  Future<bool> createProfile(Profile data) async {
    final response = await client.post(
      "$baseUrl/api/profile",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Profile>> getProfiles() async {
    final response = await client.get("$baseUrl/api/profile");
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await client.delete(
      "$baseUrl/api/profile/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  String url ="https://reqres.in/api/";

  // Future<List<Employees>> getEmployees() async {
  //   final res = await http.get("http://dummy.restapiexample.com/api/v1/employees");
  //
  //   if (res.statusCode == 200) {
  //     var json = jsonDecode(res.body);
  //     List data = json['data'];
  //     return data.map((employees) => new Employees.fromJson(employees)).toList();
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }


Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async{
  String append = "login";

  final response = await http.post(url + append,body: loginRequestModel.toJson());
  if(response.statusCode == 200 || response.statusCode ==400){
    return LoginResponseModel.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load data');
  }
}

  final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(apiUrl);
    return json.decode(result.body)['results'];

  }

}