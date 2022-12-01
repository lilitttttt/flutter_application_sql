import 'package:flutter_application_sql/data/model/poezd.dart';
import 'package:flutter_application_sql/data/model/tips.dart';
import 'package:flutter_application_sql/domain/entity/poezd.dart';
import 'package:flutter_application_sql/domain/entity/brigada.dart';
import 'package:flutter_application_sql/domain/entity/tips.dart';

class PoezdEntity {
  late int id;
  final String NomerPoezd;
  final int idBrigada;
  final PoezdTipsEnum idTips;

  PoezdEntity({
    this.id = 0,
    required this.NomerPoezd,
    required this.idBrigada,
    required this.idTips,
  });
}
