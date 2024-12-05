import 'package:flutter/material.dart';
import 'package:proyecto_clase/src/menu/menu.dart';
import 'package:proyecto_clase/src/pages/login.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const LoginPage(),
    'menu': (BuildContext context) => const MenuPage(
          token: "",
        ),
  };
}