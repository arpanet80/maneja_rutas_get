import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Register"),
            SizedBox(height: 50),
            TextField(
              onChanged: (valor) {
                nombre = valor;
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Get.back(
                    result:
                        nombre); // Retorna a la pagina anterior pasandole parametros
              },
              child: Text(
                "Regresar",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
