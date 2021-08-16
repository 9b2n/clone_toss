import 'package:clone_toss/home.dart';
import 'package:clone_toss/myConsunmptionPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'toss',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final tabs = [
    Home(),
    MyConsumption(),
    Center(child: Text('Camera')),
    Center(child: Text('Profile')),
    Center(child: Text('Random')),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "홈",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
            label: "내 소비",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars),
              label: "혜택",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: "주식",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "전체",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}