import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:maneja_rutas_get/app/ui/pages/home_page.dart';
import 'package:maneja_rutas_get/app/ui/pages/home_map_page.dart';
import 'package:maneja_rutas_get/app/ui/pages/login_page.dart';
import 'package:maneja_rutas_get/app/ui/pages/register_page.dart';
import 'package:maneja_rutas_get/app/ui/pages/splash_page.dart';
import 'package:maneja_rutas_get/app/ui/pages/uder_clon.dart';
import 'package:maneja_rutas_get/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.home: (_) => HomePage(),
      Routes.splash: (_) => const SplashPage(),
      Routes.login: (_) => const LoginPage(),
      Routes.register: (_) => RegisterPage(),
      Routes.driverMap: (_) => HomeMapPage(),
      Routes.uberClonMap: (_) => UberClonPage(),
    };
