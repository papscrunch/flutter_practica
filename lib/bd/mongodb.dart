// ignore_for_file: avoid_print, null_argument_to_non_null_type, prefer_typing_uninitialized_variables

import 'package:mongo_dart/mongo_dart.dart';
import 'package:tareanba/constantes/constantes.dart';
import 'package:tareanba/models/jugador_model.dart';
import 'package:tareanba/models/partidos_model.dart';
import 'package:tareanba/models/puntuaciones.dart';

//
class MongoDB {
  static var bd, 
  coleccionJugadores, 
  coleccionPartidos, 
  coleccionPuntuacion;

  static conectar() async {
    bd = await Db.create(CONEXION);
    await bd.open();
    coleccionJugadores = bd.collection(COLECCION1);
    coleccionPartidos = bd.collection(COLECCION2);
    coleccionPuntuacion = bd.collection(COLECCION3);
  } 
  static Future<List<Map<String, dynamic>>> getJugadores() async {
    try {
      final jugadores = await coleccionJugadores.find().toList();
      return jugadores;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
  static insertar(Jugador jugador) async {
    await coleccionJugadores.insertAll([jugador.toMap()]);
  }
  static actualizar(Jugador jugador) async {
    var j = await coleccionJugadores.findOne({"_id": jugador.id});
    j['nombre'] = jugador.nombre;
    j['dorsal'] = jugador.dorsal;
    j['equipo'] = jugador.equipo;
    await coleccionJugadores.save(j);
  }
  static eliminar(Jugador jugador) async {
    await coleccionJugadores.remove(where.id(jugador.id));
  }
  //
  //
  //
  //
  static Future<List<Map<String, dynamic>>> getPartidos() async {
    try {
      final partidos = await coleccionPartidos.find().toList();
      return partidos;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
  static insertarPartido(PartidosModel partido) async {
    await coleccionPartidos.insertAll([partido.toMap()]);
  }
  static actualizarPartido(PartidosModel partido) async {
    var p = await coleccionPartidos.findOne({"_id": partido.id});
    p['juego'] = partido.juego;
    p['visitante'] = partido.visitante;
    p['local'] = partido.local;
    p['ptsvisita'] = partido.ptsvisita;
    p['ptslocal'] = partido.ptslocal;
    await coleccionPartidos.save(p);
  }
  static eliminarPartido(PartidosModel partido) async {
    await coleccionPartidos.remove(where.id(partido.id));
  }
  //
  //
  //
  //
  //
  static Future<List<Map<String, dynamic>>> getPuntos() async {
    try {
      final puntuacion = await coleccionPuntuacion.find().toList();
      return puntuacion;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
  static insertarPuntos(PuntuacionTemp puntuacion) async {
    await coleccionPuntuacion.insertAll([puntuacion.toMap()]);
  }
  static actualizarPuntos(PuntuacionTemp puntuacion) async {
    var pp = await coleccionPuntuacion.findOne({"_id": puntuacion.id});
    pp['jugador'] = puntuacion.jugador;
    pp['puntos'] = puntuacion.puntos;
    pp['asistencias'] = puntuacion.asistencias;
    pp['bloqueos'] = puntuacion.bloqueos;
    pp['faltas'] = puntuacion.faltas;
    await coleccionPuntuacion.save(pp);
  }
  static eliminarPuntos(PuntuacionTemp puntuacion) async {
    await coleccionPuntuacion.remove(where.id(puntuacion.id));
  }
}
