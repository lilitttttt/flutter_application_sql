import 'package:flutter_application_sql/domain/entity/stancii.dart';

class Stancii extends StanciiEntity {
  Stancii({
    super.id = 0,
    required super.NameStancii,
  });

  Map<String, dynamic> toMap() {
    return {
      'NameStancii': NameStancii,
    };
  }

  factory Stancii.toFromMap(Map<String, dynamic> json) {
    return Stancii(
      id: json['id'] as int,
      NameStancii: json['NameStancii'],
    );
  }
}
