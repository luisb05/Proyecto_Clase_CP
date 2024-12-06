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
        backgroundColor: Colors.purple[300],
        title: const Text('Clientes'),        
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
      ),
      body: customers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple[200],
                        child: Text(
                          customer['nombres']?.substring(0, 1) ?? 'N',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                      ),
                      title: Text(
                        customer['nombres'] + ""+ customer['apellidos'] ?? 'Sin Nombre',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        customer['dni'] ?? 'Sin DNI',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.purple[300],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PantallaPerfilCliente(
                              idCliente: customer['customerId'].toString(),
                              nombre:
                                  customer['nombres'] ?? 'Nombre no disponible',
                              apellidos: customer['apellidos'] ??
                                  'apellidos no disponible',
                              dni: customer['dni'] ?? 'DNI no disponible',
                              estado: customer['estado'] == true ||
                                  customer['estado'].toString().toLowerCase() ==
                                      'true',
                              token: widget.token,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
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
