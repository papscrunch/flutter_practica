// ignore_for_file: unused_import
//asa
import 'package:mongo_dart/mongo_dart.dart';

class Jugador {
  final ObjectId id;
  final String nombre;
  final int dorsal;
  final String equipo;

  const Jugador(
      {required this.id,
      required this.nombre,
      required this.dorsal,
      required this.equipo});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'nombre': nombre,
      'dorsal': dorsal,
      'equipo': equipo,
    };
  }

  Jugador.fromMap(Map<String, dynamic> map)
      : 
        id = map['_id'],
        nombre = map['nombre'],
        dorsal = map['dorsal'],
        equipo = map['equipo'];
}

