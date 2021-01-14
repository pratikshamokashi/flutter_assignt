import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<SignupScreen> {
  GlobalKey<FormState> _key = new GlobalKey();

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
          'Sign up', style: new TextStyle(color: Colors.blue),
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
        new TextFormField (
          decoration: new InputDecoration(hintText: 'Email'),
          maxLength: 32,
        ),new TextFormField (
          decoration: new InputDecoration(hintText: 'Phone Number'),
          keyboardType: TextInputType.phone,
          maxLength: 10,
        ),new TextFormField (
          decoration: new InputDecoration(hintText: 'First Name'),
          maxLength: 32,
        ),new TextFormField (
          decoration: new InputDecoration(hintText: 'Last Name'),
          maxLength: 32,
        ),
        new TextFormField (
          decoration: new InputDecoration(hintText: 'Password'),
          keyboardType: TextInputType.phone,
          maxLength: 10,
        ),
        new SizedBox(height: 15.0),
        new RaisedButton (
          onPressed: _submit,
          child: new Text('Sign Up'),
        )
      ],
    );
  }

  _submit() {
    // delete all screens from stack and make dashboard as a root of app.
    // Navigator.of(context).pushNamedAndRemoveUntil('dashboardscreen',
    //     ModalRoute.withName('/'));
  }
}