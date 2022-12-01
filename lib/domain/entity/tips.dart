import 'package:flutter_application_sql/domain/entity/tips.dart';

class TipsEntity {
  late int id;
  final String NameTips;

  TipsEntity({
    this.id = 0,
    required this.NameTips,
  });
}
