import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<DashboardScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text("Dashboard"),backgroundColor: Colors.yellow,
      ),
      body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //           label: ('Home'),
      //           backgroundColor: Colors.green
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.search),
      //           label: ('Search'),
      //           backgroundColor: Colors.yellow
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         title: Text('Profile'),
      //         backgroundColor: Colors.blue,
      //       ),
      //     ],
      //     type: BottomNavigationBarType.shifting,
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: Colors.black,
      //     iconSize: 40,
      //     onTap: _onItemTapped,
      //     elevation: 5
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("Pratiksha M"),
                accountEmail: Text("pratiksha@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text("Sona",
                    style: TextStyle(fontSize: 15,),
                  ),
                )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginForm()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.wallet_giftcard), title: Text("Wallet"),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AboutUs()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.redeem), title: Text("Redeem"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ContactUs()),);
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer), title: Text("Offers"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ContactUs()),);
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money_rounded), title: Text("10 + 1 Plan"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ContactUs()),);
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag), title: Text("My GoldMine"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ContactUs()),);
                // Navigator.pop(context);
              },
            ),ListTile(
              leading: Icon(Icons.mark_email_unread_sharp), title: Text("FAQ"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ContactUs()),);
                // Navigator.pop(context);
              },
            ),ListTile(
              leading: Icon(Icons.logout), title: Text("Logout"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ContactUs()),);
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  
}