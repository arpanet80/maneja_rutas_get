import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja_rutas_get/app/ui/routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nombre),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.splash); // Carga la ruta
              },
              child: Text("Splash"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offNamed(Routes.login,
                    arguments:
                        'Prueba de paso de argumentos'); // ya no puede regresar
              },
              child: Text("Login"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                cargarRegisterPage();
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> cargarRegisterPage() async {
    dynamic nombrerecibido = await Get.toNamed(Routes.register);
    if (nombrerecibido != null) {
      nombre = nombrerecibido;

      setState(() {});
    }
  }
}
