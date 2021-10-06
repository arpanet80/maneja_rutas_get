import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maneja_rutas_get/app/ui/controllers/home_map_controller.dart';
import 'package:maneja_rutas_get/app/utils/colors.dart';
import 'package:maneja_rutas_get/app/widgets/button_app.dart';

class HomeMapPage extends StatefulWidget {
  HomeMapPage({Key? key}) : super(key: key);

  @override
  _HomeMapPageState createState() => _HomeMapPageState();
}

class _HomeMapPageState extends State<HomeMapPage> {
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
        SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buttonDrawer(), _buttonCenterPosition()],
              ),
              Expanded(child: Container()),
              _buttonConnect(),
            ],
          ),
        ),
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
