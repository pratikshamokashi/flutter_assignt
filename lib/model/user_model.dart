// import 'dart:convert';
// import 'package:json_annotation/json_annotation.dart';
//
//
// @JsonSerializable()
// class Employees {
//   final String id;
//   @JsonKey(name: 'employee_name')
//   final String employeeName;
//   @JsonKey(name: 'employee_salary')
//   final String employeeSalary;
//   @JsonKey(name: 'employee_age')
//   final String employeeAge;
//   @JsonKey(name: 'profile_image')
//   final String profileImage;
//
//   Employees({this.id, this.employeeName, this.employeeSalary, this.employeeAge, this.profileImage});
//
//   factory Employees.fromJson(Map<String, dynamic> json) =>  _$EmployeesFromJson(json);
//   Map<String, dynamic> toJson() =>_$EmployeesToJson(this);
// }
// Employees _$EmployeesFromJson(Map<String, dynamic> json) {
//   return Employees(
//     id: json['id'] as String,
//     employeeName: json['employee_name'] as String,
//     employeeSalary: json['employee_salary'] as String,
//     employeeAge: json['employee_age'] as String,
//     profileImage: json['profile_image'] as String,
//   );
// }
//
// Map<String, dynamic> _$EmployeesToJson(Employees instance) => <String, dynamic>{
//   'id': instance.id,
//   'employee_name': instance.employeeName,
//   'employee_salary': instance.employeeSalary,
//   'employee_age': instance.employeeAge,
//   'profile_image': instance.profileImage,
// };

import 'dart:convert';

class Profile {
  int id;
  String name;
  String email;
  int age;

  Profile({this.id = 0, this.name, this.email, this.age});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], name: map["name"], email: map["email"], age: map["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "age": age};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email, age: $age}';
  }

}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
