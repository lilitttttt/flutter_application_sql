import 'package:flutter_application_sql/domain/entity/role.dart';

class Role extends RoleEntity {
  Role({required super.role});

  Map<String, dynamic> toMap() {
    return {'NameRole': role};
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(role: json['NameRole']);
  }
}
