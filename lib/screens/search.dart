import 'package:flutter/material.dart';
import 'products.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> categories = ["Tərəvəzlər", "Yuyucu Tozlar", "İçkilər", "Yağlar", "Çaylar & Coffelər", "Balıqlar və Ətlər", "Çerezlər", "Dondurmalar", "Un məmulatları", "Heyvan yemləri", "Siqaretlər", "Oyuncaqlar", "Çörəklər", "Şirniyyatlar"];
  final List<String> pictures=["vegetables","powders","drinks","oils","teacoffee","fishmeat","chips","icecreams","flourproducts","animaleat","tobaccos","toys","breads","sweets"];

  var categoryItems = List<String>();
  var categoryPictures=List<String>();

  @override
  void initState() {
    categoryItems.addAll(categories);
    categoryPictures.addAll(pictures);
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
          itemCount: categoryItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${categoryItems[index]}'),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Products()));},
              leading: Image.asset("assets/${categoryPictures[index]}.jpg", width: 60.0,height: 60.0),
              //Icon(Icons.category, color: Colors.green)
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
