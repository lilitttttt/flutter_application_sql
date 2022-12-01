import 'package:flutter_application_sql/domain/entity/bilets.dart';
import 'package:flutter_application_sql/domain/entity/reis.dart';

class Bilets extends BiletsEntity {
  Bilets({
    super.id = 0,
    required super.DataBilets,
    required super.idReis,
  });

  Map<String, dynamic> toMap() {
    return {
      'DataBilets': DataBilets,
      'idReis': idReis,
    };
  }

  factory Bilets.toFromMap(Map<String, dynamic> json) {
    return Bilets(
      id: json['id'] as int,
      DataBilets: json['DataBilets'],
      idReis: json['idReis'],
    );
  }
}
