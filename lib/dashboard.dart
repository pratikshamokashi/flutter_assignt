import 'package:flutter/material.dart';
import 'package:flutter_assignment/discount.dart';
import 'package:flutter_assignment/login.dart';
import 'package:flutter_assignment/productlist.dart';
import 'package:flutter_assignment/share_service.dart';
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
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
    // DashboardScreen(),
    // ProductList(),
    // Contact(),
    // SpecialDiscount()
    Text('Home',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Text('Products List',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Contact(),
    Text('Contact us',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Text('Special discounts',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          'Home', style: new TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            Text(
              nameString,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Container(
              color: Colors.white,
              child: FlutterLogo(size: MediaQuery.of(context).size.height * .4),
            ),
          ],
        ),
      ),
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
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Products List',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contact us',
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Special discounts',
              backgroundColor: Colors.yellow,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}