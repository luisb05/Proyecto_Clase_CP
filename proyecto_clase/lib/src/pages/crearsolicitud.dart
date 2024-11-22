import 'package:flutter/material.dart';

class PantallaCrearSolicitud extends StatelessWidget {
  final TextEditingController propositoController = TextEditingController();
  final TextEditingController montoController = TextEditingController();
  final TextEditingController tasaInteresController = TextEditingController();
  final TextEditingController plazoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Solicitud')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: propositoController,
              decoration: InputDecoration(labelText: 'Propósito'),
            ),
            TextField(
              controller: montoController,
              decoration: InputDecoration(labelText: 'Monto'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tasaInteresController,
              decoration: InputDecoration(labelText: 'Tasa de Interés'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: plazoController,
              decoration: InputDecoration(labelText: 'Plazo'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí se podría agregar lógica para guardar la solicitud.
                Navigator.pop(context);
              },
              child: Text('Guardar Solicitud'),
            ),
          ],
        ),
      ),
    );
  }
}
