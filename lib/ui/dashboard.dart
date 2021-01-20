import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'file:///D:/FlutterProjects/flutter_assignment/lib/ui/discount.dart';
import 'file:///D:/FlutterProjects/flutter_assignment/lib/ui/home.dart';
import 'file:///D:/FlutterProjects/flutter_assignment/lib/ui/login.dart';
import 'file:///D:/FlutterProjects/flutter_assignment/lib/ui/productlist.dart';
import 'package:flutter_assignment/share_service.dart';
import 'package:flutter_assignment/ui/AddUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'contact.dart';

class DashboardScreen extends StatelessWidget {
  static const String _title = 'Drawer Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String nameString;

  @override
  void initState() {
    super.initState();
    nameString = "Welcome";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow,
        title:  new Text (
          nameString, style: new TextStyle(color: Colors.blue),
        ),
      ),

      body:Home(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Pratiksha M"),
              accountEmail: Text("pratiksha@gmail.com"),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.lightGreen,),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HOME'),
              //_onItemTapped("MyHomePage"),
            ),
            ListTile(
              leading: Icon(Icons.money_rounded),
              title: Text('MY WALLET'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('REDEEM'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('OFFERS'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('10+1 PLAN'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('MY GOLDMINE'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LOG OUT'),
              onTap: (){
                Fluttertoast.showToast(
                    msg: "User Logout successfully!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1
                );
                SharedService.logout().then((value) =>
                    // Navigator.of(context).pushReplacementNamed("/login"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),));
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     items:  <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //           label: 'Home',
      //           backgroundColor: Colors.yellow),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.list),
      //           label: 'Products List',
      //           backgroundColor: Colors.yellow),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.contacts),
      //         label: 'Contact us',
      //         backgroundColor: Colors.yellow,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.receipt),
      //         label: 'Special discounts',
      //         backgroundColor: Colors.yellow,
      //       ),
      //     ],
      //     type: BottomNavigationBarType.shifting,
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: Colors.green,
      //     iconSize: 40,
      //     onTap: _onItemTapped,
      //     elevation: 5),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Contact(),
    ProductList(),
    SpecialDiscount(),
    // PlaceholderWidget(Colors.white),
    // PlaceholderWidget(Colors.deepOrange),
    // PlaceholderWidget(Colors.blue),
    // PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddUser()),);
      },
        child: Icon(Icons.add, color: Colors.yellow, size: 29,),
        elevation: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Contact Us'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Products List')),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Special Discounts'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


}
