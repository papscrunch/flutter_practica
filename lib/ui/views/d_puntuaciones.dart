import 'package:flutter/material.dart';
import 'package:tareanba/bd/mongodb.dart';
import 'package:tareanba/models/puntuaciones.dart';
import 'package:tareanba/ui/widgets/auxiliares_widgets/barra_progreso.dart';
import 'package:tareanba/ui/widgets/auxiliares_widgets/error_contenedor.dart';
import 'package:tareanba/ui/widgets/fichas/d_puntuacion_ficha.dart';
import 'package:tareanba/ui/widgets/formularios/d_puntuaje.dart';

class PuntajeP extends StatefulWidget {
  const PuntajeP({Key? key}) : super(key: key);

  @override
  State<PuntajeP> createState() => _PuntajePState();
}

class _PuntajePState extends State<PuntajeP> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MongoDB.getPuntos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressIndicatorPersonal();
          } else if (snapshot.hasError) {
            return const ErrorContenedor();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Puntuaciones'),
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FichaPuntaje(
                        puntuacion:
                            PuntuacionTemp.fromMap(snapshot.data[index]),
                        onTapDelete: () async {
                          _eliminarPuntuacion(
                              PuntuacionTemp.fromMap(snapshot.data[index]));
                        },
                        onTapEdit: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const EditarPuntaje();
                                  },
                                  settings: RouteSettings(
                                    arguments: PuntuacionTemp.fromMap(
                                        snapshot.data[index]),
                                  ))).then((value) => setState(() {}));
                        }),
                  );
                },
                itemCount: snapshot.data.length,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const EditarPuntaje();
                  })).then((value) => setState(() {}));
                },
                child: const Icon(Icons.add),
              ),
            );
          }
        });
  }

  _eliminarPuntuacion(PuntuacionTemp puntuacion) async {
    await MongoDB.eliminarPuntos(puntuacion);
  }
}
