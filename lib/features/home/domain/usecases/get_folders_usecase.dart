import 'package:dartz/dartz.dart';
import 'package:ebbinghaus_method/core/usecases/usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/repository_interface/home_repository_interface.dart';

class GetFoldersUseCase extends UseCase<List<FolderEntity>, NoParams> {
  final HomeRepositoryInterface _homeRepository;

  GetFoldersUseCase(this._homeRepository);

  @override
  Future<Either<Error, List<FolderEntity>>> call(NoParams params) async {
    return _homeRepository.obterFolders();
  }
}
