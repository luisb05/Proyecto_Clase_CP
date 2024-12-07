import 'package:flutter/material.dart';

class PantallaCrearSolicitud extends StatelessWidget {
  final TextEditingController propositoController = TextEditingController();
  final TextEditingController montoController = TextEditingController();
  final TextEditingController tasaInteresController = TextEditingController();
  final TextEditingController plazoController = TextEditingController();

  PantallaCrearSolicitud({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Solicitud',
        style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor:  Colors.purple[300],
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
                labelStyle: const TextStyle(fontSize: 16),
                hintText: 'Ingrese el propósito del préstamo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
              ),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: montoController,
              decoration: InputDecoration(
                labelText: 'Monto',
                labelStyle: const TextStyle(fontSize: 16),
                hintText: 'Ingrese el monto del préstamo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: tasaInteresController,
              decoration: InputDecoration(
                labelText: 'Tasa de Interés (%)',
                labelStyle: const TextStyle(fontSize: 16),
                hintText: 'Ingrese la tasa de interés',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: plazoController,
              decoration: InputDecoration(
                labelText: 'Plazo (meses)',
                labelStyle: const TextStyle(fontSize: 16),
                hintText: 'Ingrese el plazo del préstamo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
}
