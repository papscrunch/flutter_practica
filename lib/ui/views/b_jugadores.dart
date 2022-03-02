import 'package:flutter/material.dart';
import 'package:tareanba/bd/mongodb.dart';
import 'package:tareanba/models/jugador_model.dart';
import 'package:tareanba/ui/widgets/auxiliares_widgets/barra_progreso.dart';
import 'package:tareanba/ui/widgets/auxiliares_widgets/error_contenedor.dart';
import 'package:tareanba/ui/widgets/formularios/b_jugador_editar.dart';
import 'package:tareanba/ui/widgets/fichas/b_jugador_ficha.dart';

class Jugadores extends StatefulWidget {
  const Jugadores({Key? key}) : super(key: key);

  @override
  State<Jugadores> createState() => _JugadoresState();
}

class _JugadoresState extends State<Jugadores> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MongoDB.getJugadores(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ProgressIndicatorPersonal();
        } else if (snapshot.hasError) {
          return const ErrorContenedor();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Jugadores'),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FichaJugador(
                      jugador: Jugador.fromMap(snapshot.data[index]),
                      onTapDelete: () async {
                        _eliminarJugador(Jugador.fromMap(snapshot.data[index]));
                      },
                      onTapEdit: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const EditarJugador();
                              },
                              settings: RouteSettings(
                                arguments:
                                    Jugador.fromMap(snapshot.data[index]),
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
                  return const EditarJugador();
                })).then((value) => setState(() {}));
              },
              child: const Icon(Icons.add),
            ),
          );
        }
      },
    );
  }

  _eliminarJugador(Jugador jugador) async {
    await MongoDB.eliminar(jugador);
    setState(() {});
  }
}



