import 'package:flutter_application_sql/domain/entity/tips.dart';

class Tips extends TipsEntity {
  Tips({
    super.id = 0,
    required super.NameTips,
  });

  Map<String, dynamic> toMap() {
    return {
      'NameTips': NameTips,
    };
  }

  factory Tips.toFromMap(Map<String, dynamic> json) {
    return Tips(
      id: json['id'] as int,
      NameTips: json['NameTips'],
    );
  }
}

enum PoezdTipsEnum {
  skorii(id: 1, NameTips: 'Скорый'),
  passagirskiy(id: 2, NameTips: 'Пассажирский'),
  komfort(id: 3, NameTips: 'Комфорт');

  const PoezdTipsEnum({
    required this.id,
    required this.NameTips,
  });

  final String NameTips;
  final int id;
}
