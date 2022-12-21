class CardEntity {
  final int id;
  final String pergunta;
  final String resposta;
  final int diasASerRevisto;
  final String tags;
  final int folderId;

  CardEntity(this.id, this.pergunta, this.resposta, this.diasASerRevisto,
      this.tags, this.folderId);
}
