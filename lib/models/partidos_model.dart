import 'package:mongo_dart/mongo_dart.dart';

class PartidosModel {
  final ObjectId id;
  final int juego;
  final String visitante;
  final String local;
  final int ptsvisita;
  final int ptslocal;

  const PartidosModel(
      {required this.id,
      required this.juego,
      required this.visitante,
      required this.local,
      required this.ptsvisita,
      required this.ptslocal});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'juego': juego,
      'visitante': visitante,
      'local': local,
      'ptsvisita': ptsvisita,
      'ptslocal': ptslocal,
    };
  }

  PartidosModel.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        juego = map['juego'],
        visitante = map['visitante'],
        local = map['local'],
        ptsvisita = map['ptsvisita'],
        ptslocal = map['ptslocal'];
}
