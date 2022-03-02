import 'package:mongo_dart/mongo_dart.dart';

class PuntuacionTemp {
  final ObjectId id;
  final String jugador;
  final int puntos;
  final int asistencias;
  final int bloqueos;
  final int faltas;

  const PuntuacionTemp({
    required this.id,
    required this.jugador,
    required this.puntos,
    required this.asistencias,
    required this.bloqueos,
    required this.faltas,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'jugador': jugador,
      'puntos': puntos,
      'asistencias': asistencias,
      'bloqueos': bloqueos,
      'faltas': faltas,
    };
  }

  PuntuacionTemp.fromMap(Map<String, dynamic> map)
  :
  id = map['_id'],
  jugador = map['jugador'],
  puntos = map['puntos'],
  asistencias = map['asistencias'],
  bloqueos = map['bloqueos'],
  faltas = map  ['faltas']  
  ;

}
