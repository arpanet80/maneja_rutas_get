import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maneja_rutas_get/app/helpers/stars_method.dart';
import 'package:maneja_rutas_get/app/helpers/style.dart';
import 'package:maneja_rutas_get/app/ui/controllers/home_map_controller.dart';
import 'package:maneja_rutas_get/app/utils/colors.dart';
import 'package:maneja_rutas_get/app/widgets/button_app.dart';
import 'package:maneja_rutas_get/app/widgets/custom_text.dart';
import 'package:maneja_rutas_get/app/widgets/rider_draggable.dart';

class UberClonPage extends StatefulWidget {
  UberClonPage({Key? key}) : super(key: key);

  @override
  _UberClonPageState createState() => _UberClonPageState();
}

class _UberClonPageState extends State<UberClonPage> {
  final DriverMapController _con = DriverMapController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _googleMapsWidget(),

        // Nombre y avatar del conductor con sy puntuación en estrellas
        Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: grey, blurRadius: 17)]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white30,
                          child: ClipRRect(
                            child: Image.asset('assets/img/bill.png'),
                            borderRadius: BorderRadius.circular(50.0),
                          ),

                          //child: Icon(Icons.person_outline,size: 25,),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Franklin Elias G.",
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            stars(rating: 4, votes: 500)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),

        SafeArea(
          child: Visibility(
              visible: true, //appState.show == Show.RIDER,
              child: RiderWidget()),
        ),

        /*SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buttonDrawer(),
                  _buttonCenterPosition(),
                ],
              ),
              //Expanded(child: Container()),
              //_buttonConnect(),
            ],
          ),
        ),*/
      ],
    ));
  }

  Widget _buttonCenterPosition() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        shape: CircleBorder(),
        color: personalPrimaryColor,
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.location_searching,
            color: Colors.grey[600],
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buttonDrawer() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buttonConnect() {
    return Container(
      height: 50,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: ButtonApp(
        text: 'CONECTARSE',
        color: Colors.black,
        textColor: Colors.white,
      ),
    );
  }

  Widget _googleMapsWidget() {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _con.initialPosition,
        onMapCreated: _con.onMapCreated,
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        markers: Set<Marker>.of(_con.markers.values));
  }

  void refresh() {
    setState(() {});
  }
}
