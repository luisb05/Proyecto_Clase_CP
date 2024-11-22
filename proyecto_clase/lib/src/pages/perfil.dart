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
            CircleAvatar(radius: 80, backgroundColor: Colors.blue),
            SizedBox(height: 20),
            Text('Nombre: Juan Pérez', style: TextStyle(fontSize: 20)),
            Text('DNI: 12345678', style: TextStyle(fontSize: 20)),
            Text('Estado: Activo', style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PantallaSaldos()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Ver Saldos',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(width: 16), // Separación entre los botones
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PantallaSolicitudes()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Ver Solicitudes',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


