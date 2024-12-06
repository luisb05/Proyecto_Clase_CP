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

  const PantallaSaldos({super.key, required this.idCliente, required this.token});

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
      appBar: AppBar(
        title: const Text('Saldos del Cliente'),
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
        backgroundColor: Colors.purple[300],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  'Préstamos',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...prestamos.map((prestamo) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.monetization_on, color: Colors.green),
                      title: Text('Préstamo ${prestamo.prestamoId}',
                      style: const TextStyle(fontSize: 18)),
                      subtitle: Text('Saldo: Lps ${prestamo.saldo}',
                      style: const TextStyle(fontSize: 18)),
                    ),
                  );
                }),

                const SizedBox(height: 16),

                const Text(
                  'Cuentas',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...cuentas.map((cuenta) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.account_balance_wallet, color: Colors.blue),
                      title: Text('Cuenta ${cuenta.cuentaId}',
                      style: const TextStyle(fontSize: 18)),
                      subtitle: Text('Saldo: Lps ${cuenta.saldo}',
                      style: const TextStyle(fontSize: 18)),
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
