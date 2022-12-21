import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';

class FolderModel extends FolderEntity {
  FolderModel(super.id, super.name, super.numeroCards);

  factory FolderModel.fromDatabase(Map<String, dynamic> map) {
    return FolderModel(map['id'], map['name'], map['numeroCards']);
  }
}
