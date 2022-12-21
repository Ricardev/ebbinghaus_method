import 'package:ebbinghaus_method/core/database/database.dart';
import 'package:ebbinghaus_method/cubits/home_cubit.dart';
import 'package:ebbinghaus_method/features/home/domain/repository_interface/home_repository_interface.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/get_card_usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/get_folders_usecase.dart';
import 'package:ebbinghaus_method/features/home/infra/datasource/home_datasource.dart';
import 'package:ebbinghaus_method/features/home/infra/datasource/home_datasource_interface.dart';
import 'package:ebbinghaus_method/features/home/infra/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void setup() {
  injector.registerFactory<HomeDataSourceInterface>(
      () => HomeDataSource(DatabaseApp.instance));

  injector.registerFactory<HomeRepositoryInterface>(
      () => HomeRepository(injector()));

  injector.registerFactory(() => GetFoldersUseCase(injector()));
  injector.registerFactory(() => GetCardUseCase(injector()));

  injector.registerFactory(() => HomeCubit(injector(), injector()));
}
