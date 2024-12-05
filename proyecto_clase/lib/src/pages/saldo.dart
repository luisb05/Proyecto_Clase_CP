import 'dart:convert'; // Importante para jsonDecode
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_clase/src/const/api_constanst.dart';
import 'package:proyecto_clase/src/models/cuenta.dart';
import 'package:proyecto_clase/src/models/prestamo.dart';

class PantallaSaldos extends StatefulWidget {
  final String idCliente;
  final String token;
  const PantallaSaldos(
      {super.key, required this.idCliente, required this.token});

  @override
  _PantallaSaldosState createState() => _PantallaSaldosState();
}

class _PantallaSaldosState extends State<PantallaSaldos> {
  bool isLoading = true;
  final String urlMetodoPrestamo = 'Prestamo/GetAllByCustomer';
  final String urlMetodoCuenta = 'Cuenta/GetAllByCustomer';
  List<Prestamo> prestamos = [];
  List<Cuenta> cuentas = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saldos del Cliente')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ...prestamos.map((prestamo) {
                  return Card(
                    child: ListTile(
                      title: Text('Préstamo ${prestamo.prestamoId}'),
                      subtitle: Text('Saldo:Lps ${prestamo.saldo}'),
                    ),
                  );
                }),
                ...cuentas.map((cuenta) {
                  return Card(
                    child: ListTile(
                      title: Text('Cuenta ${cuenta.cuentaId}'),
                      subtitle: Text('Saldo:Lps ${cuenta.saldo}'),
                    ),
                  );
                }),
              ],
            ),
    );
  }

  Future<void> fetchData() async {
    try {
      final headers = {
        "accept": "*/*",
        "Authorization": "Bearer ${widget.token}",
      };

      final prestamoUrl = Uri.parse(
          '${ApiConstanst.baseUrlAPI}$urlMetodoPrestamo?id=${widget.idCliente}');
      final cuentaUrl = Uri.parse(
          '${ApiConstanst.baseUrlAPI}$urlMetodoCuenta?id=${widget.idCliente}');

      final prestamoResponse = await http.get(prestamoUrl, headers: headers);

      if (prestamoResponse.statusCode == 200) {
        List<dynamic> prestamoList = jsonDecode(prestamoResponse.body);
        prestamos =
            prestamoList.map((json) => Prestamo.fromJson(json)).toList();
      } else {
        log("Error al obtener préstamos: ${prestamoResponse.statusCode}");
      }

      final cuentaResponse = await http.get(cuentaUrl, headers: headers);

      if (cuentaResponse.statusCode == 200) {
        List<dynamic> cuentaList = jsonDecode(cuentaResponse.body);
        cuentas = cuentaList.map((json) => Cuenta.fromJson(json)).toList();
      } else {
        log("Error al obtener cuentas: ${cuentaResponse.statusCode}");
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
        SnackBar(content: Text('Error al cargar datos: $e')),
      );
    }
  }
}
