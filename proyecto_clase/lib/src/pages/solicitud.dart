import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_clase/src/pages/crearsolicitud.dart';
import 'package:proyecto_clase/src/const/api_constanst.dart';
import 'package:proyecto_clase/src/models/solicitud.dart';

class PantallaSolicitudes extends StatefulWidget {
  final String idCliente;
  final String token;

  const PantallaSolicitudes({
    super.key,
    required this.idCliente,
    required this.token,
  });

  @override
  _PantallaSolicitudesState createState() => _PantallaSolicitudesState();
}

class _PantallaSolicitudesState extends State<PantallaSolicitudes> {
  bool isLoading = true;
  final String urlMetodo = 'Solicitud/GetAllByCustomerId';
  List<Solicitud> solicitudes = [];

  @override
  void initState() {
    super.initState();
    fetchSolicitudes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitudes del Cliente'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: Colors.purple[300],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : solicitudes.isEmpty
              ? const Center(
                  child: Text(
                    'No hay solicitudes disponibles',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: solicitudes.length,
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    final solicitud = solicitudes[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: solicitud.estadoTexto == "Aprobada"
                              ? Colors.green
                              : solicitud.estadoTexto == "Pendiente"
                                  ? Colors.orange
                                  : Colors.red,
                          child: const Icon(
                            Icons.assignment,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          'Solicitud ${solicitud.solicitudId}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Propósito: ${solicitud.proposito}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 18
                              ),
                            ),
                            Text(
                              'Estado: ${solicitud.estadoTexto}',
                              style: TextStyle(
                                color: solicitud.estadoTexto == "Aprobada"
                                    ? Colors.green
                                    : solicitud.estadoTexto == "Pendiente"
                                        ? Colors.orange
                                        : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PantallaCrearSolicitud(),
            ),
          );
        },
        tooltip: 'Crear nueva solicitud',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> fetchSolicitudes() async {
    try {
      final headers = {
        "accept": "*/*",
        "Authorization": "Bearer ${widget.token}",
      };

      final url = Uri.parse(
          '${ApiConstanst.baseUrlAPI}$urlMetodo?id=${widget.idCliente}');

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> solicitudList = jsonDecode(response.body);
        solicitudes =
            solicitudList.map((json) => Solicitud.fromJson(json)).toList();
      } else {
        log("Error al obtener solicitudes: ${response.statusCode}");
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      log('Error: $e');
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al cargar datos: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
