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
      // appBar: new AppBar(
      //   title: new Text("Product List"),
      // ),
      body: _employeesData(),
    );
  }
  FutureBuilder _employeesData(){
    return FutureBuilder<List<Employees>>(
      future: ApiService().getEmployees(),
      builder: (BuildContext context, AsyncSnapshot<List<Employees>> snapshot){
        if (snapshot.hasData) {
          List<Employees> data = snapshot.data;
          return _employees(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _employees(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: _tile(data[index].employeeName, data[index].employeeSalary)
          );
        }
    );
  }

  ListTile _tile(String title, String subtitle) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2Fvector-images%2Funknown-profile-picture.html&psig=AOvVaw3SpPPzaBPaWJrst3unI1j3"
            "&ust=1611134154376000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLjV2MzUp-4CFQAAAAAdAAAAABAD"),
      // leading: Icon(
      //   icon,
      //   color: Colors.blue[500],
      ),
    );
  }

  Widget fetchData(){
 //    return FutureBuilder<UserModel>(future: _apiService.getUsers(),
 //    builder: (BuildContext context,
 //        AsyncSnapshot<UserModel> snapshot){
 //      if(snapshot.hasData){
 //        return getBody(snapshot.data);
 //      }
 //      return Center(child: CircularProgressIndicator(),
 //      );
 //    },);
 //
 //    // return getBody(userModel)
   }
 // Widget getBody(UserModel userModel) {
 //    return Padding(
 //      padding: const EdgeInsets.all(10.0),
 //      child: Card(
 //        child: ListTile(
 //          title: Row(
 //            children: <Widget>[
 //              Container(
 //                width: 60,
 //                height: 60,
 //                decoration: BoxDecoration(
 //                  color: Colors.black12,
 //                  borderRadius: BorderRadius.circular(60/2),
 //                  image: DecorationImage(fit: BoxFit.cover,
 //                      image: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fsupport.hubstaff.com%2Fprofile-pictures-for-hubstaff-talent%2F&psig=AOvVaw0WmkH2eyNQYAEsNFnv2yh9&ust=1611056037676000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNCL9Mixpe4CFQAAAAAdAAAAABAN"))
 //                ),
 //              ),
 //              SizedBox(width: 20,),
 //              Text("Pratiksha")
 //            ],
 //          ),
 //        ),
 //      ),
 //    );
 // }

}


