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
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: const Text('Perfil del Cliente'),
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.purple[200],
                child: const Icon(Icons.person, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre: $nombre',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Apellidos: $apellidos',
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'DNI: $dni',
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Estado: ${estado ? 'Activo' : 'Inactivo'}',
                      style: TextStyle(
                          fontSize: 22,
                          color: estado ? Colors.green : Colors.red),
                    ),
                  ],
                ),
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
                            builder: (context) => PantallaSaldos(
                              idCliente: idCliente,
                              token: token,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: Colors.purple[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Ver Saldos',
                        style: TextStyle(fontSize: 18,color: Colors.white),
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
                            builder: (context) => PantallaSolicitudes(
                              idCliente: idCliente,
                              token: token,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: Colors.purple[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Ver Solicitudes',
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
