import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'marketlocation.dart';

class Nearby extends StatefulWidget {
  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  final List<String> dublicateItems = [
    "Qara Qarayev Araz Supermarket",
    "Bravo Supermarket",
    "Avromed Aptek",
    "Al Market",
    "Oba Market Nariman Narimanov",
    "Zafaran Aptek",
    "Bravo 28 Mall"
  ];
  var items = List<String>();

  @override
  void initState() {
    items.addAll(dublicateItems);
    super.initState();
  }

  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(40.4093, 49.8671));
  GoogleMapController _controller;
  List<Marker> markers = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(40.4093, 49.8671),
        alpha: 0.6,
        infoWindow: InfoWindow(title: "Sizin olduğunuz yer")),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(40.39, 49.8650),
        infoWindow: InfoWindow(title: "Qara Qarayev Araz Supermarket")),
    Marker(
        markerId: MarkerId("3"),
        position: LatLng(40.40, 49.88),
        infoWindow: InfoWindow(title: "Bravo Supermarket")),
    Marker(
        markerId: MarkerId("4"),
        position: LatLng(40.385, 49.89),
        infoWindow: InfoWindow(title: "Avromed Aptek")),
    Marker(
        markerId: MarkerId("5"),
        position: LatLng(40.405, 49.91),
        infoWindow: InfoWindow(title: "Al Market")),
    Marker(
        markerId: MarkerId("6"),
        position: LatLng(40.4, 49.915),
        infoWindow: InfoWindow(title: "Oba Market Nariman Narimanov")),
    Marker(
        markerId: MarkerId("7"),
        position: LatLng(40.55, 49.88),
        infoWindow: InfoWindow(title: "Zeferan Aptek")),
    Marker(
        markerId: MarkerId("8"),
        position: LatLng(40.396, 49.9),
        infoWindow: InfoWindow(title: "Bravo 28 Mall")),
    Marker(
        markerId: MarkerId("9"),
        position: LatLng(40.412, 49.85),
        infoWindow: InfoWindow(title: "Zeferan Aptek")),
  ];

  // addMarker(cordinate) {
  //   int id = Random().nextInt(100);
  //   setState(() {
  //     markers
  //         .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition.target,
                      zoom: 13.5,
                    ),
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      setState(() {
                        _controller = controller;
                        _controller.getVisibleRegion();
                      });
                    },
                    markers: markers.toSet(),
                    // onTap: (cordinate) {
                    //   _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
                    //   addMarker(cordinate);
                    //},
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Colors.green,
                  thickness: 3.0,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${items[index]}'),
                        leading: Icon(Icons.add_business,color: Colors.green),
                        trailing: Icon(Icons.keyboard_arrow_right,color: Colors.green,),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MarketLocation("${items[index]}")));
                        },
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
