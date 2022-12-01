import 'package:flutter_application_sql/domain/entity/reis.dart';
import 'package:flutter_application_sql/domain/entity/poezd.dart';

class ReisEntity {
  late int id;
  final String PriceReis;
  final int idPoezd;
  final int idRaspisanie;

  ReisEntity({
    this.id = 0,
    required this.PriceReis,
    required this.idPoezd,
    required this.idRaspisanie,
  });
}
