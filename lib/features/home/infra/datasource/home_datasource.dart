import 'package:ebbinghaus_method/core/database/database_interface.dart';
import 'package:ebbinghaus_method/core/database/scripts.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/card_entity.dart';
import 'package:ebbinghaus_method/features/home/infra/datasource/home_datasource_interface.dart';
import 'package:ebbinghaus_method/features/home/infra/models/card_model.dart';
import 'package:ebbinghaus_method/features/home/infra/models/folder_model.dart';

class HomeDataSource extends HomeDataSourceInterface {
  final IDatabaseApp _databaseApp;

  HomeDataSource(this._databaseApp);

  @override
  Future<List<FolderEntity>> obterFolders() async {
    final folders = await _databaseApp.getAll(TableNames.folderTable);
    return folders.map((folder) => FolderModel.fromDatabase(folder)).toList();
  }

  @override
  Future<List<CardEntity>> obterCards(int folderId) async {
    final cards = await _databaseApp.getAll(TableNames.cardTable,
        where: "folderId = ?", whereArgs: [folderId]);
    return cards.map((card) => CardModel.fromDatabase(card)).toList();
  }

  @override
  Future<bool> postFolder(String nomedoFolder) async {
    final success = await _databaseApp.insert(
        TableNames.folderTable, [FolderModel(null, nomedoFolder).toJson()]);
    return success.tudoCerto;
  }
}
