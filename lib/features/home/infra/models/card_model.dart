import 'package:ebbinghaus_method/features/home/domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  CardModel(super.id, super.pergunta, super.resposta, super.diasASerRevisto,
      super.tags, super.folderId);

  factory CardModel.fromDatabase(Map<String, dynamic> map) {
    return CardModel(map['id'], map['pergunta'], map['resposta'],
        map['diasASerRevisto'], map['tags'], map['folderId']);
  }
}
