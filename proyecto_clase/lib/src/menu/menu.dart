import 'package:flutter/material.dart';
import 'package:proyecto_clase/src/pages/cliente.dart';

class MenuPage extends StatefulWidget {
  final String token;
  const MenuPage({super.key, required this.token});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  get token => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Menu Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PantallaCliente(token: widget.token)));
                },
                child: const Text('Clientes')),
          ],
        ),
      ),
    );
  }
}