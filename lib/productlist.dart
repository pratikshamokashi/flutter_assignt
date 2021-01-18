import 'package:flutter/material.dart';
import 'package:flutter_assignment/api/api_service.dart';
import 'package:flutter_assignment/model/user_model.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = new ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Product List"),
      ),
      body: fetchData(),
    );
  }

  Widget fetchData(){
    return FutureBuilder<UserModel>(future: _apiService.getUsers(),
    builder: (BuildContext context,
        AsyncSnapshot<UserModel> snapshot){
      if(snapshot.hasData){
        return getBody(snapshot.data);
      }
      return Center(child: CircularProgressIndicator(),
      );
    },);

    // return getBody(userModel)
  }
 Widget getBody(UserModel userModel) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(60/2),
                  image: DecorationImage(fit: BoxFit.cover,
                      image: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fsupport.hubstaff.com%2Fprofile-pictures-for-hubstaff-talent%2F&psig=AOvVaw0WmkH2eyNQYAEsNFnv2yh9&ust=1611056037676000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNCL9Mixpe4CFQAAAAAdAAAAABAN"))
                ),
              ),
              SizedBox(width: 20,),
              Text("Pratiksha")
            ],
          ),
        ),
      ),
    );
 }

}


