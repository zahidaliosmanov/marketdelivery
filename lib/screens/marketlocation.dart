import 'package:flutter/material.dart';
import 'search.dart';

class MarketLocation extends StatelessWidget {
  String market;
  MarketLocation(this.market);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.add_business,
            color: Colors.green,
            size: 200,
          ),
          Text(
            market,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Ünvan:Zərifə Əliyeva küçəsi 83",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Uzaqlıq: 7 km",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
            SizedBox(height: 50.0,),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.green)
              ),
              color: Colors.green,
                onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));},
                child: Text("Alış veriş üçün tıklayın",style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),)),
          // IconButton(
          //     icon: Icon(Icons.shopping_bag, size: 50, color: Colors.green),
          //     onPressed: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Search()));
          //     })
        ],
      ),
    ));
  }
}
