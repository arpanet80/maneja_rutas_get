import 'package:flutter/material.dart';
//import 'package:maneja_rutas_get/app/services/call_sms.dart';
//import 'package:maneja_rutas_get/app/services/service_locator.dart';
import 'package:maneja_rutas_get/app/widgets/button_app.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

class RiderWidget extends StatelessWidget {
  //final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  @override
  Widget build(BuildContext context) {
    //AppStateProvider appState = Provider.of<AppStateProvider>(context);

    return DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 0.6,
        builder: (BuildContext context, myscrollController) {
          return Container(
            decoration: BoxDecoration(color: white,
//                        borderRadius: BorderRadius.only(
//                            topLeft: Radius.circular(20),
//                            topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(.8),
                      offset: Offset(3, 2),
                      blurRadius: 7)
                ]),
            child: ListView(
              controller: myscrollController,
              children: [
                SizedBox(
                  height: 12,
                ),
                ListTile(
                  leading: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white30,
                      radius: 30,
                      child: Image.asset('assets/img/dante.png'),
                      //child: Icon(Icons.person_outline,size: 25,),
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Dante Ibañez (Cliente)\n",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "14 de Infanteria # 63",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300)),
                      ], style: TextStyle(color: black))),
                    ],
                  ),
                  trailing: Container(
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          //_service.call('67924400'); // appState.riderModel.phone);
                        },
                        icon: Icon(Icons.call),
                      )),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: CustomText(
                    text: "Detalles del viaje",
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 100,
                      width: 10,
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: Container(
                              height: 45,
                              width: 2,
                              color: primary,
                            ),
                          ),
                          Icon(Icons.flag),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "\nLugar de recogida \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      TextSpan(
                          text: "14 de Infanteria # 63 \n\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16)),
                      TextSpan(
                          text: "Destino \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      TextSpan(
                          text: "Av. Murillo # 322 \n",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16)),
                    ], style: TextStyle(color: black))),
                  ],
                ),
                Divider(),
                Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      margin:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                      child: ButtonApp(
                        text: 'CANCELAR VIAJE',
                        color: Colors.red,
                        textColor: Colors.white,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
