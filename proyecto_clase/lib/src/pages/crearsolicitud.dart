import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_clase/src/const/api_constanst.dart';

class PantallaCrearSolicitud extends StatelessWidget {
  final TextEditingController propositoController = TextEditingController();
  final TextEditingController montoController = TextEditingController();
  final TextEditingController tasaInteresController = TextEditingController();
  final TextEditingController plazoController = TextEditingController();
  final String idCliente;
  final String token;

  PantallaCrearSolicitud({
    super.key,
    required this.idCliente,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear Solicitud',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.purple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Crear una nueva solicitud',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: propositoController,
              decoration: InputDecoration(
                labelText: 'Propósito',
                hintText: 'Ingrese el propósito del préstamo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: montoController,
              decoration: InputDecoration(
                labelText: 'Monto',
                hintText: 'Ingrese el monto del préstamo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: tasaInteresController,
              decoration: InputDecoration(
                labelText: 'Tasa de Interés (%)',
                hintText: 'Ingrese la tasa de interés',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: plazoController,
              decoration: InputDecoration(
                labelText: 'Plazo (meses)',
                hintText: 'Ingrese el plazo del préstamo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (validateFields(context)) {
                  addSolicitud(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Guardar Solicitud',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateFields(BuildContext context) {
    if (propositoController.text.trim().isEmpty) {
      showError(context, 'El propósito es requerido');
      return false;
    }
    if (montoController.text.trim().isEmpty ||
        double.tryParse(montoController.text.trim()) == null) {
      showError(context, 'El monto es requerido y debe ser un número válido');
      return false;
    }
    if (tasaInteresController.text.trim().isEmpty ||
        double.tryParse(tasaInteresController.text.trim()) == null) {
      showError(context,
          'La tasa de interés es requerida y debe ser un número válido');
      return false;
    }
    if (plazoController.text.trim().isEmpty ||
        int.tryParse(plazoController.text.trim()) == null) {
      showError(context, 'El plazo es requerido y debe ser un número válido');
      return false;
    }
    return true;
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> addSolicitud(BuildContext context) async {
    const String url = '${ApiConstanst.baseUrlAPI}Solicitud/AddSolicitud';

    try {
      final headers = {
        "accept": "*/*",
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      };

      final body = jsonEncode({
        "solicitudId": 0,
        "customerId": idCliente,
        "proposito": propositoController.text.trim(),
        "tasaInteres": int.tryParse(tasaInteresController.text.trim()) ?? 0,
        "plazo": int.tryParse(plazoController.text.trim()) ?? 0,
        "monto": double.tryParse(montoController.text.trim()) ?? 0.0,
        "fechaCreacion": DateTime.now().toUtc().toIso8601String(),
        "fechaPrestamo": DateTime.now().toUtc().toIso8601String(),
        "estado": true
      });

      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Solicitud creada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      } else {
        log("Error al crear la solicitud: ${response.statusCode} - ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al crear la solicitud: ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      log('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al crear la solicitud: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
