import 'package:flutter_application_sql/domain/entity/reis.dart';
import 'package:flutter_application_sql/domain/entity/poezd.dart';

class Reis extends ReisEntity {
  Reis({
    super.id = 0,
    required super.PriceReis,
    required super.idPoezd,
    required super.idRaspisanie,
  });

  Map<String, dynamic> toMap() {
    return {
      'PriceReis': PriceReis,
      'idPoezd': idPoezd,
      'idRaspisanie': idRaspisanie,
    };
  }

  factory Reis.toFromMap(Map<String, dynamic> json) {
    return Reis(
      id: json['id'] as int,
      PriceReis: json['PriceReis'],
      idPoezd: json['idPoezd'],
      idRaspisanie: json['idRaspisanie'],
    );
  }
}
