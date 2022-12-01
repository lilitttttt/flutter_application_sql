import 'package:flutter_application_sql/domain/entity/bilets.dart';
import 'package:flutter_application_sql/domain/entity/reis.dart';

class BiletsEntity {
  late int id;
  final String DataBilets;
  final int idReis;

  BiletsEntity({
    this.id = 0,
    required this.DataBilets,
    required this.idReis,
  });
}
