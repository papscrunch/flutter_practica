// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //semanticLabel: MenuLateral,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPictureSize: Size(90, 90),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.sports_basketball,
                size: 60,
              ),
            ),
            accountName: Text('App Basketball'),
            accountEmail: Text('prctica'),
          ),
          home(context),
          const Divider(
            thickness: 2,
          ),
          inventario(context),
          cerrajero(context),
          const Divider(
            thickness: 2,
          ),
          empleados(context),
          
        ],
      ),
    );
  }


  ListTile empleados(BuildContext context) {
    return ListTile(
          title: const Text('Puntajes'),
          leading: const Icon(
            Icons.checklist, 
            size: 25),
          onTap: () {
            Navigator.of(context).pushNamed('/puntajes');
          },
        );
  }

  ListTile cerrajero(BuildContext context) {
    return ListTile(
          title: const Text('partidos'),
          leading: const Icon(Icons.sports_handball_outlined, size: 25),
          onTap: () {
            Navigator.of(context).pushNamed('/partido');
          },
        );
  }

  ListTile inventario(BuildContext context) {
    return ListTile(
          title: const Text('jugadores'),
          leading: const Icon(Icons.person, size: 25),
          onTap: () {
            Navigator.of(context).pushNamed('/jugador');
          },
        );
  }

  ListTile home(BuildContext context) {
    return ListTile(
          title: const Text('Home'),
          leading: const Icon(
            Icons.home,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/home');
          },
        );
  }
}
