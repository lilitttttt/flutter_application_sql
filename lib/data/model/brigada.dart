import 'package:flutter_application_sql/domain/entity/brigada.dart';

class Brigada extends BrigadaEntity {
  Brigada({
    super.id = 0,
    required super.NameBrigada,
  });

  Map<String, dynamic> toMap() {
    return {
      'NameBrigada': NameBrigada,
    };
  }

  factory Brigada.toFromMap(Map<String, dynamic> json) {
    return Brigada(
      id: json['id'] as int,
      NameBrigada: json['NameBrigada'],
    );
  }
}
