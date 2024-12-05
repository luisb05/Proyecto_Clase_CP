import 'package:flutter/material.dart';
import 'package:proyecto_clase/src/pages/saldo.dart';
import 'package:proyecto_clase/src/pages/solicitud.dart';

class PantallaPerfilCliente extends StatelessWidget {
  final String idCliente;
  final String nombre;
  final String dni;
  final String apellidos;
  final bool estado;
  final String token;

  const PantallaPerfilCliente({
    super.key,
    required this.idCliente,
    required this.nombre,
    required this.dni,
    required this.apellidos,
    required this.estado,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil del Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 80, backgroundColor: Colors.blue),
            const SizedBox(height: 20),
            Text('Nombre: $nombre', style: const TextStyle(fontSize: 20)),
            Text('Apellidos: $apellidos', style: const TextStyle(fontSize: 20)),
            Text('DNI: $dni', style: const TextStyle(fontSize: 20)),
            Text(
              'Estado: ${estado ? 'Activo' : 'Inactivo'}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PantallaSaldos(idCliente: idCliente, token: token),),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      'Ver Saldos',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PantallaSolicitudes(idCliente: idCliente, token: token)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
