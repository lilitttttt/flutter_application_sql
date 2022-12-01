import 'package:flutter_application_sql/domain/entity/raspisanie.dart';

class Raspisanie extends RaspisanieEntity {
  Raspisanie(
      {super.id = 0,
      required super.DataOtpr,
      required super.DataPrib,
      required super.idStancii});

  Map<String, dynamic> toMap() {
    return {
      'DataOtpr': DataOtpr,
      'DataPrib': DataPrib,
      'idStancii': idStancii,
    };
  }

  factory Raspisanie.toFromMap(Map<String, dynamic> json) {
    return Raspisanie(
      id: json['id'] as int,
      DataOtpr: json['DataOtpr'],
      DataPrib: json['DataPrib'],
      idStancii: json['idStancii'],
    );
  }
}
