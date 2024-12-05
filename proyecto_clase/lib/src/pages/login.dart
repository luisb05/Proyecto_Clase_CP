import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_clase/src/const/api_constanst.dart';
import 'package:proyecto_clase/src/menu/menu.dart';
import 'package:proyecto_clase/src/models/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController claveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(labelText: "Usuario"),
            ),
            TextField(
              controller: claveController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                login(context);
              },
              child: const Text('Iniciar Sesion'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    try {
      final Map<String, String> body = {
        "userId": usuarioController.text,
        "password": claveController.text,
      };
      final headers = {
        "accept": "*/*",
        "Content-Type": "application/json",
      };
      final url = Uri.parse('${ApiConstanst.baseUrlAPI}Security/login');
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final login = Login.fromJson(responseData);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MenuPage(token: login.accessToken)));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Datos de acceso incorrectos"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Aceptar"),
                    )
                  ],
                ));
      }
    } catch (e) {
      print("Error:$e");
      log('Error: $e');
    }
  }
}
