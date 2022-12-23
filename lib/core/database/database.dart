import 'package:ebbinghaus_method/core/database/database_interface.dart';
import 'package:ebbinghaus_method/core/database/scripts.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseApp extends IDatabaseApp {
  DatabaseApp._();
  static final DatabaseApp instance = DatabaseApp._();

  static Database? _database;

  Future<Database> get dataBase async {
    if (_database != null) return _database!;
    return await initDatabase();
  }

  @override
  Future<Database> initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'flashCards.db'),
        version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int versao) async {
    await db.execute(DatabaseScripts.createFolder);
    await db.execute(DatabaseScripts.createCard);
  }

  @override
  Future<DatabaseResult> insert(
      String tabela, List<Map<String, dynamic>> objetos) async {
    try {
      final db = await instance.dataBase;
      for (final objeto in objetos) {
        await db.insert(tabela, objeto,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      return DatabaseResult.success;
    } on DatabaseException catch (e) {
      debugPrint(e.result.toString());
      return DatabaseResult.fail;
    } catch (e) {
      debugPrint("Erro ao inserir elemento na base de dados");
      return DatabaseResult.fail;
    }
  }

  @override
  Future<List<Map<String, Object?>>> getAll(String tabela,
      {String? where, List<dynamic>? whereArgs, String? orderBy}) async {
    final db = await instance.dataBase;
    final dadosDoBanco = await db.query(tabela,
        where: where, whereArgs: whereArgs, orderBy: orderBy);

    return dadosDoBanco;
  }

  @override
  Future<List<Map<String, Object?>>> getAllRaw<T>(String query) async {
    final db = await instance.dataBase;
    var dadosDoBanco = await db.rawQuery(query);

    return dadosDoBanco;
  }

  @override
  Future<DatabaseResult> update(
      String tabela, Map<String, Object?> objeto, dynamic id,
      {String column = 'insercaoId'}) async {
    try {
      final db = await instance.dataBase;
      await db.update(
        tabela,
        objeto,
        where: '$column = ?',
        whereArgs: [id],
      );
      return DatabaseResult.success;
    } on DatabaseException catch (e) {
      debugPrint(e.result.toString());
      return DatabaseResult.fail;
    }
  }

  @override
  Future<DatabaseResult> deleteRaw(
    String query,
  ) async {
    try {
      await _database!.rawDelete(query);
      return DatabaseResult.success;
    } on DatabaseException catch (e) {
      debugPrint(e.result.toString());
      return DatabaseResult.fail;
    }
  }

  @override
  Future<DatabaseResult> delete(
      {String? id,
      required String table,
      String? column,
      String? where,
      List? whereArgs}) async {
    try {
      await _database!.delete(
        table,
        where: where ?? '$column = ?',
        whereArgs: whereArgs ?? [id],
      );
      return DatabaseResult.success;
    } on DatabaseException catch (e) {
      debugPrint(e.result.toString());
      return DatabaseResult.fail;
    }
  }
}

enum DatabaseResult {
  success(1, true),
  fail(-1, false);

  final int resultValue;
  final bool tudoCerto;
  const DatabaseResult(this.resultValue, this.tudoCerto);
}
