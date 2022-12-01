import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_sql/common/data_base_request.dart';
import 'package:flutter_application_sql/data/model/role.dart';
import 'package:flutter_application_sql/data/model/sotrudnik.dart';
import 'package:flutter_application_sql/domain/entity/role.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 3;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'Flutter_SQL/pr2BD.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }

      db.insert(
          DataBaseRequest.tableSotrudnik,
          Sotrudnik(
                  login: 'admin',
                  fam: 'Nikiforova',
                  idRole: RoleEnum.admin,
                  otch: 'Urevna',
                  name: 'Liza',
                  password: 'Admin111')
              .toMap());
      db.insert(
          DataBaseRequest.tableSotrudnik,
          Sotrudnik(
                  login: 'user',
                  fam: 'Khutornaya',
                  idRole: RoleEnum.user,
                  otch: 'Sergeevna',
                  name: 'Polina',
                  password: 'User111')
              .toMap());

      // db.insert(DataBaseRequest.tableBrigada,
      //     Brigada(NameBrigada: 'Бригада обслуживания').toMap());

      // // DataBaseRequest.tablePoezd,
      // // Poezd(NomerPoezd: '№128', idTips: PoezdTipsEnum.komfort, idBrigada: 1)
      // //     .toMap());
      // db.insert(
      //     DataBaseRequest.tablePoezd,
      //     Poezd(
      //             NomerPoezd: '№3',
      //             idTips: PoezdTipsEnum.passagirskiy,
      //             idBrigada: 2)
      //         .toMap());
      // db.insert(
      //     DataBaseRequest.tablePoezd,
      //     Poezd(NomerPoezd: '№56', idTips: PoezdTipsEnum.skorii, idBrigada: 3)
      //         .toMap());
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
    await onInitTable(db);
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    await onCreateTable(db);
  }

  Future<void> onDropDataBse() async {
    await database.close();

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
