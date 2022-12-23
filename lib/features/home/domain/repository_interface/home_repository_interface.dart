import 'package:dartz/dartz.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/card_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/post_card_usecase.dart';

abstract class HomeRepositoryInterface {
  Future<Either<Error, List<FolderEntity>>> obterFolders();
  Future<Either<Error, List<CardEntity>>> obterCards(int folderId);
  Future<Either<Error, bool>> postFolder(String folderName);
  Future<Either<Error, bool>> postCard(CardParams cardParams);
}
