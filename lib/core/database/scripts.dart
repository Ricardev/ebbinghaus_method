class DatabaseScripts {
  static const String createFolder = """CREATE TABLE folder (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    numeroCards INTEGER
  ); """;

  static const String createCard = """CREATE TABLE card (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pergunta TEXT,
    resposta TEXT,
    diaParaRevisar TEXT,
    tags TEXT,
    folderId INT,
    FOREIGN KEY (folderId)
      REFERENCES folder (id)
  ); """;
}

class TableNames {
  static const String folderTable = "folder";
  static const String cardTable = "card";
}
