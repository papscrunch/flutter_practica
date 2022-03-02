import 'package:flutter/material.dart';
import 'package:tareanba/bd/mongodb.dart';
import 'package:tareanba/ui/rutas/app.dart';
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.conectar();
  runApp(const MyApp());
}


