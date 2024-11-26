import 'package:flutter/material.dart';
import 'package:proyecto_clase/src/pages/saldo.dart';
import 'package:proyecto_clase/src/pages/solicitud.dart';

class PantallaPerfilCliente extends StatelessWidget {
  const PantallaPerfilCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil del Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:  [
            const CircleAvatar(radius: 80, backgroundColor: Colors.blue),
            const SizedBox(height: 20),
            const Text('Nombre: Juan Pérez', style: TextStyle(fontSize: 20)),
            const Text('DNI: 12345678', style: TextStyle(fontSize: 20)),
            const Text('Estado: Activo', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 30),
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
                    child: const Text(
                      'Ver Saldos',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Separación entre los botones
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
                    child: const Text(
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


