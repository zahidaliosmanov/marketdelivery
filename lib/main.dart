import 'package:flutter/material.dart';
import 'package:marketdelivery/screens/home.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main()=> runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: "Market Delivery",
      home: Home(),
    );
  }
}