import 'package:flutter_application_sql/domain/entity/raspisanie.dart';

class RaspisanieEntity {
  late int id;
  final String DataOtpr;
  final String DataPrib;
  final int idStancii;

  RaspisanieEntity({
    this.id = 0,
    required this.DataOtpr,
    required this.DataPrib,
    required this.idStancii,
  });
}
