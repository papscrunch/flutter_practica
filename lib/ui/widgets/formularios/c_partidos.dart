import 'package:flutter/material.dart';
import 'package:tareanba/bd/mongodb.dart';
import 'package:tareanba/models/partidos_model.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class EditarPartido extends StatefulWidget {
  const EditarPartido({Key? key}) : super(key: key);

  @override
  State<EditarPartido> createState() => _EditarPartidoState();
}

class _EditarPartidoState extends State<EditarPartido> {
  static const EDICION = 1;
  static const INSERCION = 2;
  TextEditingController jueCont /*  */ = TextEditingController();
  TextEditingController locCont /*  */ = TextEditingController();
  TextEditingController visCont /*  */ = TextEditingController();
  TextEditingController ptslCont /*  */ = TextEditingController();
  TextEditingController ptsvCont /*  */ = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textoWidget = "Añadir Puntaje";
    int operacion = INSERCION;
    PartidosModel? partido;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      operacion = EDICION;
      partido = ModalRoute.of(context)?.settings.arguments as PartidosModel;
      jueCont.text = partido.juego.toString();
      locCont.text = partido.local;
      visCont.text = partido.visitante;
      ptslCont.text = partido.ptslocal.toString();
      ptsvCont.text = partido.ptsvisita.toString();
      textoWidget = "Editar Puntaje";
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
                    controller: jueCont,
                    decoration: const InputDecoration(
                      hintText: "Jornada",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: locCont,
                    decoration: const InputDecoration(
                      hintText: "Local",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: visCont,
                    decoration: const InputDecoration(
                      hintText: "visitante",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: ptslCont,
                    decoration: const InputDecoration(
                      hintText: "Puntos Local",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: ptsvCont,
                    decoration: const InputDecoration(
                      hintText: "Puntos Visitante",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 16, 4),
              child: ElevatedButton(
                child: Text(textoWidget),
                onPressed: () {
                  if (operacion == EDICION) {
                    _actualizarP(partido!);
                  } else {
                    _insertarP();
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _insertarP() async {
    final partido = PartidosModel(
        id: M.ObjectId(),
        juego: int.parse(jueCont.text),
        local: locCont.text,
        visitante: visCont.text,
        ptslocal: int.parse(ptslCont.text),
        ptsvisita: int.parse(ptsvCont.text));
    await MongoDB.insertarPartido(partido);
  }

  _actualizarP(PartidosModel partido) async {
    final p = PartidosModel(
        id: partido.id,
        juego: int.parse(jueCont.text),
        local: locCont.text,
        visitante: visCont.text,
        ptslocal: int.parse(ptslCont.text),
        ptsvisita: int.parse(ptsvCont.text));
    await MongoDB.actualizarPartido(p);
  }

  @override
  void dispose() {
    super.dispose();
    jueCont.dispose();
    locCont.dispose();
    visCont.dispose();
    ptslCont.dispose();
    ptsvCont.dispose();
  }
}
/* 




 */
