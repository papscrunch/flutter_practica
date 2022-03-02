import 'package:flutter/material.dart';
import 'package:tareanba/models/puntuaciones.dart';

class FichaPuntaje extends StatelessWidget {
  const FichaPuntaje({Key? key, 
    required this.puntuacion,
    required this.onTapDelete,
    required this.onTapEdit,
  }) : super(key: key);
  final PuntuacionTemp puntuacion;
  final VoidCallback onTapDelete, onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.deepOrangeAccent,
      child: ListTile(
        leading: Column(
          children: [
            Text("PTS"),
            Text('${puntuacion.puntos}',
            style: Theme.of(context).textTheme.headline4,),
          ],
        ),
        title: Text(puntuacion.jugador),
        subtitle: Text('Asistencias ${puntuacion.asistencias}, Bloqueos ${puntuacion.bloqueos}, Faltas ${puntuacion.faltas}',
        style: Theme.of(context).textTheme.headline5,),
        trailing: Column(
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
