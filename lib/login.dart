import 'package:flutter/material.dart';
import 'package:flutter_assignment/dashboard.dart';
import 'package:flutter_assignment/signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<LoginScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar (backgroundColor: Colors.yellow,
        leading: new IconButton (
          icon: new Icon (
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text (
          'Login', style: new TextStyle(color: Colors.blue),
        ),
      ),
      body: new SingleChildScrollView (
        child: new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form (
            key: _key,
            child: getFormUI(),
          ),
        ),
      ),
    );
  }

  Widget getFormUI() {
    return new Column (
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Welcome to NeoStore',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            )),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        FlatButton(
          onPressed: (){
            //forgot password screen
          },
          textColor: Colors.blue,
          child: Text('Forgot Password'),
        ),
        Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Login'),
              onPressed: _submit,
              // () {
              //   _submit,
              //   print(nameController.text);
              //   print(passwordController.text);
              // },
            )
        ),
        Container(
            child: Row(
              children: <Widget>[
                Text('Does not have account?'),
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),);
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
      ],
    );
  }        // new TextFormField (
        //   decoration: new InputDecoration(hintText: 'Email'),
        //   maxLength: 32,
        // ),
        // new TextFormField (
        //   decoration: new InputDecoration(hintText: 'Password'),
        //   keyboardType: TextInputType.phone,
        //   maxLength: 10,
        // ),
        // new SizedBox(height: 15.0),
        // new RaisedButton (
        //   onPressed: _submit,
        //   child: new Text('Login'),
        // )


  _submit() {
    // delete all screens from stack and make dashboard as a root of app.
    // Navigator.of(context).pushNamedAndRemoveUntil('dashboardscreen',
    //     ModalRoute.withName('/'));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),);
  }
}