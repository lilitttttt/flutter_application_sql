abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = "role";
  static const String tableSotrudnik = "sotrudnik";
  static const String tableBrigada = "brigada";
  static const String tableTips = "tips";
  static const String tablePoezd = "poezd";
  static const String tableBilets = "bilets";
  static const String tableReis = "reis";
  static const String tableRaspisanie = "raspisanie";
  static const String tableStancii = "stancii";

  static const List<String> tableList = [
    tableRole,
    tableSotrudnik,
    tableBrigada,
    tableTips,
    tablePoezd,
    tableBilets,
    tableReis,
    tableRaspisanie,
    tableStancii,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableSotrudnik,
    _createTableBrigada,
    _createTableTips,
    _createTablePoezd,
    _createTableBilets,
    _createTableReis,
    _createTableRaspisanie,
    _createTableStancii,
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"NameRole" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Brigada
  static const String _createTableBrigada =
      'CREATE TABLE "$tableBrigada" ("id" INTEGER,"NameBrigada" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Tips
  static const String _createTableTips =
      'CREATE TABLE "$tableTips" ("id" INTEGER,"NameTips" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Poezd
  static const String _createTablePoezd =
      'CREATE TABLE "$tablePoezd" ("id"	INTEGER, "id_tips"	INTEGER, "id_brigada"	INTEGER, "NomerPoezd" TEXT NOT NULL,FOREIGN KEY("id_brigada") REFERENCES "brigada"("id") ON DELETE CASCADE,FOREIGN KEY("id_tips") REFERENCES "tip"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Bilets
  static const String _createTableBilets =
      'CREATE TABLE "$tableBilets" ("id"	INTEGER,"id_reis"	INTEGER, "DataBilet" TEXT NOT NULL,FOREIGN KEY("id_reis") REFERENCES "reis"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Reis
  static const String _createTableReis =
      'CREATE TABLE "$tableReis" ("id"	INTEGER,"PriceReis" TEXT NOT NULL,"id_poezd" INTEGER, "id_raspisanie" INTEGER, FOREIGN KEY ("id_poezd") REFERENCES "poezd"("id") ON DELETE CASCADE, FOREIGN KEY("id_raspisanie") REFERENCES "raspisanie"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Raspisanie
  static const String _createTableRaspisanie =
      'CREATE TABLE "$tableRaspisanie" ("id"	INTEGER, "DataOtpr" TEXT NOT NULL,"DataPrib" TEXT NOT NULL, "id_stancii" INTEGER,FOREIGN KEY("id_stancii") REFERENCES "stancii"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Sotrudnik
  static const String _createTableSotrudnik =
      'CREATE TABLE "$tableSotrudnik" ("id"	INTEGER, "id_role"	INTEGER, "fam" TEXT NOT NULL,"name" TEXT NOT NULL,"otch"	TEXT NULL,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,FOREIGN KEY("id_role") REFERENCES "role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Stancii
  static const String _createTableStancii =
      'CREATE TABLE "$tableStancii" ("id" INTEGER,"NameStancii" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
}
