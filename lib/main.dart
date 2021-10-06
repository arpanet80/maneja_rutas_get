import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja_rutas_get/app/ui/pages/home_page.dart';
import 'package:maneja_rutas_get/app/ui/pages/home_map_page.dart';
import 'package:maneja_rutas_get/app/ui/pages/uder_clon.dart';
//import 'app/ui/routes/app_routes.dart';
import 'app/ui/pages/login_page.dart';
import 'app/ui/pages/register_page.dart';
import 'app/ui/pages/splash_page.dart';
import 'app/ui/routes/routes.dart';

void main() {
  /*MaterialApp MyApp = MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    routes: appRoutes,
    initialRoute: Routes.home,
  );
  runApp(MyApp);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.uberClonMap,
      getPages: [
        GetPage(name: Routes.home, page: () => HomePage()),
        GetPage(name: Routes.splash, page: () => SplashPage()),
        GetPage(name: Routes.login, page: () => LoginPage()),
        GetPage(name: Routes.register, page: () => RegisterPage()),
        GetPage(name: Routes.driverMap, page: () => HomeMapPage()),
        GetPage(name: Routes.uberClonMap, page: () => UberClonPage()),
      ],
    );
  }
}
