import 'dart:io';
import 'package:flutter/material.dart';
import 'package:marketdelivery/screens/ProductClass.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

class Cart extends StatefulWidget {
  final String pictureName;
  final String name;
  final String price;
  final String weightNumb;
  final String finalPrice;
  final String selectedUnit;
  Cart(this.pictureName, this.name, this.price, this.weightNumb, this.finalPrice, this.selectedUnit);
  @override
  _CartState createState() => _CartState();
}


class _CartState extends State<Cart> {
  ProductClass productClass;
  static int itemCounter = 0;
  List<ProductClass> productsInCart=[];

  @override
  void initState() {
    print("I am in init");
    //ReadAndPutDataToProductsInCart();
    print(productClass.toString());
    if (widget.name != "Example") {
      productClass=ProductClass(widget.pictureName, widget.name, widget.price, widget.weightNumb, widget.finalPrice, widget.selectedUnit);
      print("I Am in before error of product");
      productsInCart.add(productClass);
      writeDataToFile(productsInCart);
      ReadAndPutDataToProductsInCart();
      itemCounter++;
    }
    super.initState();
  }

  void ReadAndPutDataToProductsInCart() async {
    print("I am in Read and Put Data");
    productsInCart= await readDataFromFile();
    print(productsInCart[0].toString());
    print("i come until end of Read and Data");
  }

  @override
  void dispose() {
    writeDataToFile(productsInCart);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ReadAndPutDataToProductsInCart();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: productsInCart.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    '${productsInCart[index].name} -${productsInCart[index].weightNumb} ${productsInCart[index].selectedUnit}'),
                subtitle: Text("${productsInCart[index].finalPrice} AZN"),
                leading: Image.asset("assets/${productsInCart[index].pictureName}.jpg",
                    width: 60, height: 60),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.green,
                  onPressed: () {},
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<File> writeDataToFile(List<ProductClass> productsInCart) async {
    final file = await _localFile;
    String writeAbleString;
    for (int i = 0; i < productsInCart.length; i++) {
      writeAbleString="${writeAbleString},${(productsInCart[i].toString())}";
    }
    return file.writeAsString(writeAbleString);
  }

  Future<List<ProductClass>> readDataFromFile() async {
    print("I am in read data");
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      List<String> splitedData = [];
      if (contents.isNotEmpty) {
        splitedData = contents.split(",");
        print("I am in read data 2");
      }

      List<ProductClass> productsInCart;
      ProductClass productClass;
      print("I am in read data 3");
      print("Splitted data length : ${splitedData.length}");
      print(splitedData.toString());
      for(int i=0;i<splitedData.length/7;i++){
        productClass=ProductClass(splitedData[i], splitedData[++i], splitedData[++i], splitedData[++i], splitedData[++i], splitedData[++i]);
        productsInCart.add(productClass);
      }
      print("My last point is here before error");
      return productsInCart;
    } catch (e) {
      // If encountering an error, return 0.
      return [];
    }
  }
}
