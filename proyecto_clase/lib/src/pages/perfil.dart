import 'package:flutter/material.dart';
import 'package:proyecto_clase/src/pages/saldo.dart';
import 'package:proyecto_clase/src/pages/solicitud.dart';

class PantallaPerfilCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil del Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundColor: Colors.blue),
            SizedBox(height: 20),
            Text('Nombre: Juan Pérez', style: TextStyle(fontSize: 18)),
            Text('DNI: 12345678', style: TextStyle(fontSize: 18)),
            Text('Estado: Activo', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaSaldos()),
                );
              },
              child: Text('Ver Saldos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaSolicitudes()),
                );
              },
              child: Text('Ver Solicitudes'),
            ),
          ],
        ),
      ),
    );
  }
}

