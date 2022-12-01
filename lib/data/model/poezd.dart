import 'package:flutter_application_sql/data/model/tips.dart';
import 'package:flutter_application_sql/domain/entity/poezd.dart';

class Poezd extends PoezdEntity {
  Poezd({
    super.id = 0,
    required super.NomerPoezd,
    required super.idBrigada,
    required super.idTips,
  });

  Map<String, dynamic> toMap() {
    return {
      'NomerPoezd': NomerPoezd,
      'idBrigada': idBrigada,
      'idTips': idTips,
    };
  }

  factory Poezd.toFromMap(Map<String, dynamic> json) {
    return Poezd(
        id: json['id'] as int,
        NomerPoezd: json['NomerPoezd'],
        idBrigada: json['idBrigada'],
        idTips: PoezdTipsEnum.values
            .firstWhere((element) => element.id == (json['idTips'] as int)));
  }
}
