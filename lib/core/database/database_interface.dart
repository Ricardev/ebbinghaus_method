import 'package:sqflite/sqflite.dart';

import 'database.dart';

abstract class IDatabaseApp {
  Future<Database> initDatabase();

  Future<DatabaseResult> insert(
      String tabela, List<Map<String, dynamic>> objetos);

  Future<List<Map<String, Object?>>> getAll(String tabela,
      {String? where, List<dynamic>? whereArgs, String? orderBy});

  Future<List<Map<String, Object?>>> getAllRaw<T>(String query);

  Future<DatabaseResult> update(
      String tabela, Map<String, Object?> objeto, dynamic id,
      {String column = 'insercaoId'});

  Future<DatabaseResult> deleteRaw(
    String query,
  );

  Future<DatabaseResult> delete(
      {String? id,
      required String table,
      String? column,
      String? where,
      List? whereArgs});
}
