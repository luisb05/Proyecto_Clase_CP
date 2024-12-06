import 'package:flutter/material.dart';
import 'package:proyecto_clase/src/pages/cliente.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyecto_clase/src/pages/login.dart';

class MenuPage extends StatefulWidget {
  final String token;
  const MenuPage({super.key, required this.token});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: const Text(
          'Menu Principal',
          style: TextStyle(color: Colors.white,fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app,color: Colors.white,),
            onPressed: _logout,
          ),
        ],
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    height: 100,                    
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PantallaCliente(token: widget.token)),
                        ).then((_) {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      },
                      icon: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Clientes',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[300],
                        disabledForegroundColor:
                            Colors.transparent.withOpacity(0.38),
                        disabledBackgroundColor:
                            Colors.transparent.withOpacity(0.12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
      ),
    );
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
