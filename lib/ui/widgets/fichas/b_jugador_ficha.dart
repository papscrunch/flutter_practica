// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tareanba/models/jugador_model.dart';

class FichaJugador extends StatelessWidget {
  //const FichaJugador({Key? key}) : super(key: key);
  FichaJugador(
      {required this.jugador,
      required this.onTapDelete,
      required this.onTapEdit});
  final Jugador jugador;
  final VoidCallback onTapDelete, onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.red,
      child: ListTile(
        leading: Text('${jugador.dorsal}', style: Theme.of(context).textTheme.headline6),
        title: Text(jugador.nombre),
        subtitle: Text(jugador.equipo),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: const Icon(Icons.edit),
              onTap: onTapEdit
            ),
            GestureDetector(
              child: const Icon(Icons.delete),
              onTap: onTapDelete,
            ),
          ],
        ),        
      ),
    );
  }
}
