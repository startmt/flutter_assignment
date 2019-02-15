import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String tag = 'main-screen';
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5,
      child: Scaffold(
         appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white30,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.view_quilt)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.explore)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
       
        body: TabBarView(
          children: [
            Center(child: Text("Home", style: TextStyle(fontSize: 40),)),
            Center(child: Text("Notify", style: TextStyle(fontSize: 40))),
            Center(child: Text("Map", style: TextStyle(fontSize: 40))),
            Center(child: Text("Profile", style: TextStyle(fontSize: 40))),
            Center(child: Text("Setup", style: TextStyle(fontSize: 40))),
          ],
        ),
      ),
    );
  }
}