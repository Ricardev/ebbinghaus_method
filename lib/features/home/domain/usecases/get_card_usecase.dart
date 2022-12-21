import 'package:dartz/dartz.dart';
import 'package:ebbinghaus_method/core/usecases/usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/entities/card_entity.dart';
import 'package:ebbinghaus_method/features/home/domain/repository_interface/home_repository_interface.dart';

class GetCardUseCase extends UseCase<List<CardEntity>, int> {
  final HomeRepositoryInterface _homeRepository;

  GetCardUseCase(this._homeRepository);

  @override
  Future<Either<Error, List<CardEntity>>> call(int params) async {
    return _homeRepository.obterCards(params);
  }
}
