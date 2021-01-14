import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/signup.dart';

import 'dashboard.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String , WidgetBuilder> {
        // '/landingscreen':(BuildContext context) => new LandingScreen(),
        '/login':(BuildContext context) => new LoginScreen(),
        '/signup':(BuildContext context) => new SignupScreen(),
        '/dashboardscreen':(BuildContext context) => new DashboardScreen(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(backgroundColor: Colors.yellow,
        title: new Text("Landing Screen",
          style: new TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/login');

                }, child: new Text("Login",
                  style: TextStyle( color: Colors.black, fontSize: 20)
              ),
              ),
              new RaisedButton(onPressed: (){
                Navigator.of(context).pushNamed('/signup');
              },
              child: new Text("Sign up",
              style: TextStyle(color: Colors.black,fontSize: 20),
              ),
              ),
              Expanded(child: Align(
                alignment: Alignment.bottomRight,
                child: Text("SKIP"),
              ))
              // new Text("SKIP",
              // alignment: Alignment.bottomRight,
              // style: TextStyle(color: Colors.black,fontSize: 25),)
              ],
        ),
      ),
    );
  }
}