import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:tareanba/bd/mongodb.dart';
import 'package:tareanba/models/puntuaciones.dart';

class EditarPuntaje extends StatefulWidget {
  const EditarPuntaje({Key? key}) : super(key: key);

  @override
  State<EditarPuntaje> createState() => _EditarPuntajeState();
}

/* required this.id,
    required this.jugador,
    required this.puntos,
    required this.asistencias,
    required this.bloqueos,
    required this.faltas, */
class _EditarPuntajeState extends State<EditarPuntaje> {
  static const EDICION = 1;
  static const INSERCION = 2;
  TextEditingController jugCont = TextEditingController();
  TextEditingController ptsCont = TextEditingController();
  TextEditingController asiCont = TextEditingController();
  TextEditingController bloCont = TextEditingController();
  TextEditingController falCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textoWidget = "Añadir Estadistica";
    int operacion = INSERCION;
    PuntuacionTemp? puntuacion;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      operacion = EDICION;
      puntuacion = ModalRoute.of(context)?.settings.arguments as PuntuacionTemp;
      jugCont.text = puntuacion.jugador;
      ptsCont.text = puntuacion.puntos.toString();
      asiCont.text = puntuacion.asistencias.toString();
      bloCont.text = puntuacion.bloqueos.toString();
      falCont.text = puntuacion.faltas.toString();
      textoWidget = "Editar Estadistica";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(textoWidget),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: jugCont,
                    decoration: const InputDecoration(
                      hintText: "Jugador",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: ptsCont,
                    decoration: const InputDecoration(
                      hintText: "Puntos",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: asiCont,
                    decoration: const InputDecoration(
                      hintText: "Asistencias",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: bloCont,
                    decoration: const InputDecoration(
                      hintText: "Bloqueos",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: falCont,
                    decoration: const InputDecoration(
                      hintText: "Faltas",
                    ),
                  ),
                ),
              ], //children primer Columna
            ),
          ), //
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 16, 4),
              child: ElevatedButton(
                child: Text(textoWidget),
                onPressed: () {
                  if (operacion == EDICION) {
                    _actualizarPu(puntuacion!);
                  } else {
                    _insertarPu();
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ), //
        ],
      ),
    );
  }

  _insertarPu() async {
    final puntuacion = PuntuacionTemp(
      id: M.ObjectId(),
      jugador: jugCont.text,
      puntos: int.parse(ptsCont.text),
      asistencias: int.parse(asiCont.text),
      bloqueos: int.parse(bloCont.text),
      faltas: int.parse(falCont.text),
    );
    await MongoDB.insertarPuntos(puntuacion);
  }

  _actualizarPu(PuntuacionTemp puntuacion) async {
    final pt = PuntuacionTemp(
      id: puntuacion.id,
      jugador: jugCont.text,
      puntos: int.parse(ptsCont.text),
      asistencias: int.parse(asiCont.text),
      bloqueos: int.parse(bloCont.text),
      faltas: int.parse(falCont.text),
    );
    await MongoDB.actualizarPuntos(pt);
  }

  @override
  void dispose() {
    super.dispose();
    jugCont.dispose();
    ptsCont.dispose();
    asiCont.dispose();
    bloCont.dispose();
    falCont.dispose();
  }
}
