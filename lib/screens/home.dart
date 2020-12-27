import 'package:flutter/material.dart';
import 'package:marketdelivery/screens/discounts.dart';
import 'package:marketdelivery/screens/nearby.dart';
import 'package:marketdelivery/screens/search.dart';
import 'home_screen.dart';
import 'nearby.dart';
import 'cart.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Nearby(),
    Search(),
    Cart("apple","Example ","1.5" , "5","7.5","Ədəd"),
    Discounts(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.green, primaryColor: Colors.red),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Nearby"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card_rounded), label: "Virtual Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Discounts"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
