import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Error, Type>> call(Params params);
}

class NoParams {}
