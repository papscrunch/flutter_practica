import 'package:flutter/material.dart';
import 'package:tareanba/bd/mongodb.dart';
import 'package:tareanba/models/partidos_model.dart';
import 'package:tareanba/ui/widgets/auxiliares_widgets/barra_progreso.dart';
import 'package:tareanba/ui/widgets/auxiliares_widgets/error_contenedor.dart';
import 'package:tareanba/ui/widgets/fichas/c_partidos_ficha.dart';
import 'package:tareanba/ui/widgets/formularios/c_partidos.dart';

class PartidoP extends StatefulWidget {
  const PartidoP({Key? key}) : super(key: key);

  @override
  State<PartidoP> createState() => _PartidoPState();
}

class _PartidoPState extends State<PartidoP> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MongoDB.getPartidos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ProgressIndicatorPersonal();
        } else if (snapshot.hasError) {
          return const ErrorContenedor();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Partidos'),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FichaPartidos(
                      partido: PartidosModel.fromMap(snapshot.data[index]),
                      onTapDelete: () async {
                        _eliminarPartido(PartidosModel.fromMap(snapshot.data[index]));
                      },
                      onTapEdit: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const EditarPartido();
                              },
                              settings: RouteSettings(
                                arguments:
                                    PartidosModel.fromMap(snapshot.data[index]),
                              ),
                            )).then((value) => setState(() {}));
                      }),
                );
              },
              itemCount: snapshot.data.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const EditarPartido();
                })).then((value) => setState(() {}));
              },
              child: const Icon(Icons.add),
            ),
          );
        }
      },
    );
  }

  _eliminarPartido(PartidosModel partido) async {
    await MongoDB.eliminarPartido(partido);
    setState(() {});
  }
}



