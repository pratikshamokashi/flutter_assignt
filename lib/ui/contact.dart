import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/api/api_service.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'AddUser.dart';
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Contact List"),
      // ),
      body :UserList()
    );
  }
}

class UserList extends StatelessWidget{

  String _name(dynamic user){
    return user['name']['title'] + " " + user['name']['first'] + " " +  user['name']['last'];

  }

  String _location(dynamic user){
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user){
    return "Age: " + user['dob']['age'].toString();
  }
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: apiService.getProfiles(),
          builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Profile> profiles = snapshot.data;
              return _buildListView(profiles);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        // child: FutureBuilder<List<dynamic>>(
        //
        //   future: apiService.fetchUsers(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if(snapshot.hasData){
        //       print(_age(snapshot.data[0]));
        //       return ListView.builder(
        //           padding: EdgeInsets.all(8),
        //           itemCount: snapshot.data.length,
        //           itemBuilder: (BuildContext context, int index){
        //             return
        //               Card(
        //                 child: Column(
        //                   children: <Widget>[
        //                     ListTile(
        //                       leading: CircleAvatar(
        //                           radius: 30,
        //                           backgroundImage: NetworkImage(snapshot.data[index]['picture']['large'])),
        //                       title: Text(_name(snapshot.data[index])),
        //                       subtitle: Text(_location(snapshot.data[index])),
        //                       trailing: Text(_age(snapshot.data[index])),
        //                     )
        //                   ],
        //                 ),
        //               );
        //           });
        //     }else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   },
        //
        //
        // ),
      ),
    );
  }
  Widget _buildListView(List<Profile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Profile profile = profiles[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      profile.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(profile.email),
                    Text(profile.age.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Warning"),
                                    content: Text("Are you sure want to delete data profile ${profile.name}?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          apiService.deleteProfile(profile.id).then((isSuccess) {
                                            if (isSuccess) {
                                              Fluttertoast.showToast(
                                                  msg: "User Deleted successfully...!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIos: 1
                                              );
                                              // setState(() {});
                                              // Scaffold.of(this.context)
                                              //     .showSnackBar(SnackBar(content: Text("Delete data success")));
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "User not deleted successfully...!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIos: 1
                                              );
                                              // Scaffold.of(this.context)
                                              //     .showSnackBar(SnackBar(content: Text("Delete data failed")));
                                            }
                                          }
                                          );
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        FlatButton(
                          onPressed: () async {
                            var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return AddUser(profile: profile);
                            }));
                            // if (result != null) {
                            //   setState(() {});
                            // }
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: profiles.length,
      ),
    );
  }

}
