import 'package:dartz/dartz.dart';
import 'package:ebbinghaus_method/core/usecases/usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/repository_interface/home_repository_interface.dart';

class PostCardUseCase extends UseCase<bool, CardParams> {
  final HomeRepositoryInterface _homeRepository;

  PostCardUseCase(this._homeRepository);
  @override
  Future<Either<Error, bool>> call(CardParams params) async {
    return _homeRepository.postCard(params);
  }
}

class CardParams {
  final String pergunta;
  final String resposta;
  final int folderId;
  final String tags;

  CardParams(this.pergunta, this.resposta, this.folderId, this.tags);

  Map<String, dynamic> toDatabase() => <String, dynamic>{
        "pergunta": pergunta,
        "resposta": resposta,
        "folderId": folderId,
        "tags": tags,
        "diaParaRevisar": DateTime.now().toIso8601String()
      };
}
