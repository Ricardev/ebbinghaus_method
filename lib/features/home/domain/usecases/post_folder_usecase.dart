import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository_interface/home_repository_interface.dart';

class PostFolderUseCase extends UseCase<bool, String> {
  final HomeRepositoryInterface _homeRepository;

  PostFolderUseCase(this._homeRepository);

  @override
  Future<Either<Error, bool>> call(String params) async {
    return _homeRepository.postFolder(params);
  }
}
