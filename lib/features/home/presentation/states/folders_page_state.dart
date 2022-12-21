import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';
import 'package:equatable/equatable.dart';

abstract class FoldersPageState extends Equatable {}

class FoldersPageInitialState extends FoldersPageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FoldersPageSuccessState extends FoldersPageState {
  final List<FolderEntity> folders;

  FoldersPageSuccessState(this.folders);

  @override
  List<Object?> get props => [folders];
}

class FoldersPageErrorState extends FoldersPageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
