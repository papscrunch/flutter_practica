import 'package:flutter/material.dart';
import 'package:tareanba/models/partidos_model.dart';

class FichaPartidos extends StatelessWidget {
  const FichaPartidos(
      {Key? key,
      required this.partido,
      required this.onTapDelete,
      required this.onTapEdit})
      : super(key: key);
  final PartidosModel partido;
  final VoidCallback onTapDelete, onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.deepOrange,
      child: ListTile(
        leading: Text(
          '${partido.juego}',
          style: Theme.of(context).textTheme.headline4,
        ),
        title: Text('${partido.local} VS ${partido.visitante}'),
        subtitle: Text('Puntos Local ${partido.ptslocal} Puntos Visitante  ${partido.ptsvisita}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: const Icon(Icons.edit),
              onTap: onTapEdit,
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
