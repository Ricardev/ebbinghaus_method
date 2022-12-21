import 'package:dartz/dartz.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/card_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/repository_interface/home_repository_interface.dart';
import 'package:ebbinghaus_method/features/home/infra/datasource/home_datasource_interface.dart';

class HomeRepository extends HomeRepositoryInterface {
  final HomeDataSourceInterface _homeDataSourceInterface;

  HomeRepository(this._homeDataSourceInterface);
  @override
  Future<Either<Error, List<FolderEntity>>> obterFolders() async {
    try {
      final folders = await _homeDataSourceInterface.obterFolders();
      return Right(folders);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, List<CardEntity>>> obterCards(int folderId) async {
    try {
      final cards = await _homeDataSourceInterface.obterCards(folderId);
      return Right(cards);
    } catch (e) {
      return Left(Error());
    }
  }
}
