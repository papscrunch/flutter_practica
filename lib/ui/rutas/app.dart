import 'package:flutter/material.dart';
import 'package:tareanba/ui/views/a_portada.dart';
import 'package:tareanba/ui/views/b_jugadores.dart';
import 'package:tareanba/ui/views/c_partidos.dart';
import 'package:tareanba/ui/views/d_puntuaciones.dart';



class MyApp  extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica Basquetball',
      darkTheme: ThemeData.dark(),
      initialRoute: '/portada',
      routes: {
        '/portada': (BuildContext context) => Home(),
        '/jugador': (BuildContext context) => Jugadores(),
        '/partido': (BuildContext context) => PartidoP(),
        '/puntajes': (BuildContext context) => PuntajeP(),
        }
    );
  }
}