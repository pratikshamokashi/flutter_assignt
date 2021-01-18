class DataModel{
  List<UserModel> data;
  DataModel({this.data});
  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(data:
    (json["data"] as List).map((i) => UserModel.fromJson(i)).toList(),);
  }
}

class UserModel{
  final int id;
  final String email;
  final String fname;
  final String avatar;
   UserModel({this.id,this.email,this.fname,this.avatar});
   factory UserModel.fromJson(Map<String,dynamic> json){
     return UserModel(id: json["id"],email: json["email"],fname: json["first_name"]);
   }
}