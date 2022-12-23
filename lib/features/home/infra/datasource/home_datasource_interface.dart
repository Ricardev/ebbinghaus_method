import 'package:ebbinghaus_method/features/home/domain/entities/card_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/post_card_usecase.dart';

abstract class HomeDataSourceInterface {
  Future<List<FolderEntity>> obterFolders();
  Future<List<CardEntity>> obterCards(int folderId);
  Future<bool> postFolder(String nomedoFolder);
  Future<bool> postCard(CardParams cardParams);
}
