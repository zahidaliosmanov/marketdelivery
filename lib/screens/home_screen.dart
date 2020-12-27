import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 5.0,right: 5.0),
        child: SafeArea(
            child: Column(
          children: [
            Flexible(
                flex: 3,
                child: ListView(
                  padding: EdgeInsets.all(10.0),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("assets/a.jpg")),
                    SizedBox(width: 10.0),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("assets/b.jpg")),
                    SizedBox(width: 10.0),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("assets/c.jpg")),
                    SizedBox(width: 10.0),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("assets/d.jpg")),
                    SizedBox(width: 10.0),
                  ],
                )),
            Text(
              "Special Offers",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.green,
              ),
            ),
            Flexible(
              flex: 3,
              child: ListView(
                padding: EdgeInsets.all(10.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset("assets/h.jpg")),
                  SizedBox(width: 10.0),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset("assets/g.jpg")),
                  SizedBox(width: 10.0),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset("assets/e.jpg")),
                  SizedBox(width: 10.0),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset("assets/f.jpg")),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ],
        )));
  }
}
