// ignore_for_file: constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:tareanba/bd/mongodb.dart';
import 'package:tareanba/models/jugador_model.dart';

class EditarJugador extends StatefulWidget {
  const EditarJugador({Key? key}) : super(key: key);

  @override
  State<EditarJugador> createState() => _EditarJugadorState();
}

class _EditarJugadorState extends State<EditarJugador> {
  static const EDICION = 1;
  static const INSERCION = 2;
/* noCon = nombreController
   eqCon = equipoController
   dorCon = dorsalController */

  TextEditingController noCon = TextEditingController();
  TextEditingController eqCon = TextEditingController();
  TextEditingController dorCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textoWidget = "Añadir jugador";
    int operacion = INSERCION;
    Jugador? jugador;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      operacion = EDICION;
      jugador = ModalRoute.of(context)?.settings.arguments as Jugador;
      noCon.text = jugador.nombre;
      eqCon.text = jugador.equipo;
      dorCon.text = jugador.dorsal.toString();
      textoWidget = "Editar Jugador";
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
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noCon,
                  decoration: const InputDecoration(labelText: "Nombre"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: eqCon,
                  decoration: const InputDecoration(labelText: "Equipo"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: dorCon,
                  decoration: const InputDecoration(labelText: "Dorsal"),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 16, 4),
              child: ElevatedButton(
                child: Text(textoWidget),
                onPressed: () {
                  if (operacion == EDICION) {
                    _actualizarJugador(jugador!);
                  } else {
                    _insertarJugador();
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _insertarJugador() async {
    final jugador = Jugador(
        id: M.ObjectId(),
        nombre: noCon.text,
        dorsal: int.parse(dorCon.text),
        equipo: eqCon.text);
    await MongoDB.insertar(jugador);
  }

  _actualizarJugador(Jugador jugador) async {
    final j = Jugador(
        id: jugador.id,
        nombre: noCon.text,
        equipo: eqCon.text,
        dorsal: int.parse(dorCon.text));
    await MongoDB.actualizar(j);
  }

  @override
  void dispose() {
    super.dispose();
    noCon.dispose();
    eqCon.dispose();
    dorCon.dispose();
  }
}
