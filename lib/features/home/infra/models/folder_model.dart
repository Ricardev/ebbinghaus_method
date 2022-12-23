import 'package:ebbinghaus_method/features/home/domain/entities/folder_entity.dart';

class FolderModel extends FolderEntity {
  FolderModel(super.id, super.name, {super.numeroCards = 0});

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'nome': name, 'numeroCards': numeroCards};

  factory FolderModel.fromDatabase(Map<String, dynamic> map) {
    return FolderModel(map['id'], map['nome'], numeroCards: map['numeroCards']);
  }
}
