import 'package:flutter/material.dart';

class PantallaSaldos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saldos del Cliente')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              title: Text('Cuenta de Ahorros'),
              subtitle: Text('Saldo: \$2000.00'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Préstamo 1'),
              subtitle: Text('Saldo: \$5000.00'),
            ),
          ),
        ],
      ),
    );
  }
}
