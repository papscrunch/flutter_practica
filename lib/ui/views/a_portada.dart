import 'package:flutter/material.dart';
import 'package:tareanba/ui/widgets/drawer/drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica BasquetApp'),
        
      ),
      body: const Center(
        child: Text('HOLA'),
      ),
      drawer: const DrawerMenu(),
      
      
    );
  }
}