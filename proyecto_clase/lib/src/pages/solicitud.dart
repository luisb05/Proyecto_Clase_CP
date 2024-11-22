import 'package:flutter/material.dart';
import 'package:proyecto_clase/src/pages/crearsolicitud.dart';

class PantallaSolicitudes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Solicitudes del Cliente')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              title: Text('Solicitud 1'),
              subtitle: Text('Estado: Aprobada'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Solicitud 2'),
              subtitle: Text('Estado: En Revisión'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PantallaCrearSolicitud()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
