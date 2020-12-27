import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketdelivery/screens/cart.dart';

class ProductsDetail extends StatefulWidget {
  final String price;
  final String name;
  final String pictureName;
  final int index;

  ProductsDetail(this.pictureName, this.name, this.price, this.index);

  @override
  _ProductsDetailState createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  String price;
  String name;
  String pictureName;
  int index;
  double weightNumb = 1;
  List<String> _units = ['Ədəd', 'Kq'];
  String _selectedUnit;
  double finalPrice;

  final inputController = TextEditingController();

  @override
  void initState() {
    pictureName = widget.pictureName;
    name = widget.name;
    price = widget.price;
    index = widget.index;
    _selectedUnit = _units[0];
    finalPrice = double.parse(price) * weightNumb;
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    weightNumb = double.parse(inputController.text);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Məhsulun səhifəsi"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                    child: Image.asset("assets/$pictureName.jpg",
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 2)),
              ),
              Divider(height: 1.0, color: Colors.green, thickness: 3.0),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Text("Məhsulun adı: ",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        letterSpacing: 1.5,
                      )),
                  Text("$name",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Text("Məhsulun qiyməti: ",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        letterSpacing: 1.5,
                      )),
                  Text("$price AZN",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: inputController,
                cursorColor: Colors.green,
                onChanged: (input) {
                  weightNumb = double.parse(input);
                  finalPrice = (double.parse(price) * weightNumb);
                },
              ),
              DropdownButton(
                hint: Text('Zəhmət olmasa ölçü vahidini seçin'),
                // Not necessary for Option 1
                value: _selectedUnit,
                elevation: 2,
                style: TextStyle(color: Colors.green, fontSize: 15.0),
                onChanged: (newValue) {
                  setState(() {
                    _selectedUnit = newValue;
                  });
                },
                items: _units.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Text("Yekun Məbləğ: ",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        letterSpacing: 1.5,
                      )),
                  Text("${finalPrice.toStringAsFixed(2)} AZN",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                    Cart("$pictureName","$name","$price","$weightNumb","${finalPrice.toStringAsFixed(2)}","$_selectedUnit");
                  },
                  child: Text(
                    "Səbətə əlavə etmək üçün tıklayın",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
