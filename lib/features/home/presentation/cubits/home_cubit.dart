import 'package:ebbinghaus_method/core/usecases/usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/get_card_usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/get_folders_usecase.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/post_folder_usecase.dart';
import 'package:ebbinghaus_method/features/home/presentation/states/folders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<FoldersPageState> {
  HomeCubit(this._foldersUseCase, this._cardUseCase, this._postFolderUseCase)
      : super(FoldersPageInitialState());

  final GetFoldersUseCase _foldersUseCase;
  final GetCardUseCase _cardUseCase;
  final PostFolderUseCase _postFolderUseCase;
  Future<void> obterFolders() async {
    final foldersResponse = await _foldersUseCase(NoParams());

    foldersResponse.fold(
        (error) => null, (folders) => emit(FoldersPageSuccessState(folders)));
  }

  Future<void> postFolder(String folderName) async {
    final postFolderResponse = await _postFolderUseCase(folderName);
    await obterFolders();
  }
}
