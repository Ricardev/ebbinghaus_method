import 'package:ebbinghaus_method/core/camera/camera_wrapper.dart';
import 'package:ebbinghaus_method/core/camera/i_camera_wrapper.dart';
import 'package:ebbinghaus_method/core/database/database.dart';
import 'package:ebbinghaus_method/core/utils/text_recognition/text_recognition.dart';
import 'package:ebbinghaus_method/core/utils/text_recognition/text_recognition_impl.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/post_card_usecase.dart';
import 'package:ebbinghaus_method/features/home/presentation/cubits/add_card_cubit.dart';
import 'package:ebbinghaus_method/features/home/presentation/cubits/home_cubit.dart';
import 'package:ebbinghaus_method/features/home/domain/repository_interface/home_repository_interface.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/get_card_usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/get_folders_usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/post_folder_usecase.dart';
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
  injector.registerFactory<TextRecognition>(() => TextRecognitionImpl());
  injector.registerSingleton<ICamera>(Camera());

  injector.registerFactory(() => GetFoldersUseCase(injector()));
  injector.registerFactory(() => GetCardUseCase(injector()));
  injector.registerFactory(() => PostFolderUseCase(injector()));
  injector.registerFactory(() => PostCardUseCase(injector()));
  injector.registerFactory(() => HomeCubit(injector(), injector(), injector()));
  injector
      .registerFactory(() => AddCardCubit(injector(), injector(), injector()));
}
