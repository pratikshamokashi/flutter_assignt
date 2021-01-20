import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/api/api_service.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'package:flutter_assignment/ui/dashboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddUser extends StatefulWidget {
  Profile profile;

  AddUser({this.profile});

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNameValid;
  bool _isFieldEmailValid;
  bool _isFieldAgeValid;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();

  @override
  void initState() {
    if (widget.profile != null) {
      _isFieldNameValid = true;
      _controllerName.text = widget.profile.name;
      _isFieldEmailValid = true;
      _controllerEmail.text = widget.profile.email;
      _isFieldAgeValid = true;
      _controllerAge.text = widget.profile.age.toString();
    }    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.yellow,
        title: new Text("User Profile",
        style: TextStyle(color: Colors.blue),),
      ),
      body: Stack(
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(10,0,10,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _buildTextFieldName(),
                      _buildTextFieldEmail(),
                      _buildTextFieldAge(),
                  Padding(padding: EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        widget.profile == null
                            ? "Submit".toUpperCase()
                            : "Update Data".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                        onPressed: () {
                          if (_isFieldNameValid == null ||
                              _isFieldEmailValid == null ||
                              _isFieldAgeValid == null ||
                              !_isFieldNameValid ||
                              !_isFieldEmailValid ||
                              !_isFieldAgeValid) {
                            _scaffoldState.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Please fill all field"),
                              ),
                            );
                            return;
                          }
                    setState(() {
                      _isLoading = true;
                    });
                          String name = _controllerName.text.toString();
                          String email = _controllerEmail.text.toString();
                          int age = int.parse(_controllerAge.text.toString());
                          Profile profile =
                          Profile(name: name, email: email, age: age);
                          if(widget.profile == null){
                            _apiService.createProfile(profile).then((isSuccess) {
                              setState(() => _isLoading = false);
                              if (isSuccess) {
                                Fluttertoast.showToast(
                                    msg: "User Added successfully...!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIos: 1
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DashboardScreen()),);
                                // Navigator.pop(_scaffoldState.currentState.context, true);
                              } else {
                                _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Submit data failed"),
                                ));
                              }
                            });
                            } else {
                            // profile.id = widget.profile.id;
                            // _apiService.updateProfile(profile).then((isSuccess) {
                            //   setState(() => _isLoading = false);
                            //   if (isSuccess) {
                            //     Navigator.pop(_scaffoldState.currentState.context, true);
                            //   } else {
                            //     _scaffoldState.currentState.showSnackBar(SnackBar(
                            //       content: Text("Update data failed"),
                            //     ));
                            //   }
                            // });
                          }
                          }
                    ),
                  )
                          ],
                  ),
                )
              ],
      ),
    );
  }

  Widget _buildTextFieldName()  {
    return TextFormField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full name",
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextFormField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAge() {
    return TextFormField(
      controller: _controllerAge,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Age",
        errorText: _isFieldAgeValid == null || _isFieldAgeValid
            ? null
            : "Age is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAgeValid) {
          setState(() => _isFieldAgeValid = isFieldValid);
        }
      },
    );
  }

}
