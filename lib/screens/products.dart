import 'package:flutter/material.dart';
import 'dart:math';
import 'package:marketdelivery/screens/productsdetail.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final List<String> products = ["Soğan", "Alma", "Banan", "Mandarin", "Göyərti", "Kələm", "Qarpız", "Yemiş", "Əzgil", "Kartof", "Ananas", "Pomidor", "Xiyar", "Kök"];
  final List<String> prices=List.generate(1000, (index) => (Random().nextDouble()*10).toStringAsFixed(2));
  final List<String> names=["sogan","apple","banan","mandarin","greens","cabbage","watermelon","melon","ezgil","potato","ananas","tomato","cucumber","carrot"];

  var productItems = List<String>();
  var productPrices=List<String>();
  var productNames=List<String>();

  @override
  void initState() {
    productItems.addAll(products);
    productPrices.addAll(prices);
    productNames.addAll(names);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),


      body: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: productItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${productItems[index]}'),
              subtitle: Text("${productPrices[index]} AZN"),
              leading: Image.asset("assets/${productNames[index]}.jpg", width: 60,height: 60,),
              //Icon(Icons.category, color: Colors.green)
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsDetail("${(productNames[index])}","${(productItems[index])}","${(productPrices[index])}",index)));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
