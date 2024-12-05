import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_clase/src/const/api_constanst.dart';
import 'package:proyecto_clase/src/pages/perfilcliente.dart';

class PantallaCliente extends StatefulWidget {
  final String token;
  const PantallaCliente({super.key, required this.token});

  @override
  State<PantallaCliente> createState() => _PantallaClienteState();
}

class _PantallaClienteState extends State<PantallaCliente> {
  final String urlMetodo = 'Customer/GetAllCustomer';
  List<dynamic> customers = [];

  @override
  void initState() {
    super.initState();
    getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: customers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return ListTile(
                  title: Text(customer['dni'] ?? 'Sin DNI'),
                  subtitle: Text(customer['nombres'] ?? 'Sin Nombre'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PantallaPerfilCliente(
                          idCliente: customer['customerId'].toString(),
                          nombre: customer['nombres'] ?? 'Nombre no disponible',
                          apellidos: customer['apellidos'] ??
                              'apellidos no disponible',
                          dni: customer['dni'] ?? 'DNI no disponible',
                          estado: customer['estado'] == true ||
                              customer['estado'].toString().toLowerCase() ==
                                  'true',
                          token: widget.token, // Pasando el token
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  Future<void> getCustomers() async {
    try {
      final headers = {
        "accept": "*/*",
        "Authorization": "Bearer ${widget.token}",
      };
      final url = Uri.parse('${ApiConstanst.baseUrlAPI}$urlMetodo');
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        setState(() {
          customers = jsonDecode(response.body);
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
