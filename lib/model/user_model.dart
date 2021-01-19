import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Employees {
  final String id;
  @JsonKey(name: 'employee_name')
  final String employeeName;
  @JsonKey(name: 'employee_salary')
  final String employeeSalary;
  @JsonKey(name: 'employee_age')
  final String employeeAge;
  @JsonKey(name: 'profile_image')
  final String profileImage;

  Employees({this.id, this.employeeName, this.employeeSalary, this.employeeAge, this.profileImage});

  factory Employees.fromJson(Map<String, dynamic> json) =>  _$EmployeesFromJson(json);
  Map<String, dynamic> toJson() =>_$EmployeesToJson(this);
}
Employees _$EmployeesFromJson(Map<String, dynamic> json) {
  return Employees(
    id: json['id'] as String,
    employeeName: json['employee_name'] as String,
    employeeSalary: json['employee_salary'] as String,
    employeeAge: json['employee_age'] as String,
    profileImage: json['profile_image'] as String,
  );
}

Map<String, dynamic> _$EmployeesToJson(Employees instance) => <String, dynamic>{
  'id': instance.id,
  'employee_name': instance.employeeName,
  'employee_salary': instance.employeeSalary,
  'employee_age': instance.employeeAge,
  'profile_image': instance.profileImage,
};
