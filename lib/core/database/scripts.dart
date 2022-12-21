class DatabaseScripts {
  static const String createFolder = """CREATE TABLE folder (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    numeroCards INTEGER,
  ); """;

  static const String createCard = """CREATE TABLE card (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pergunta TEXT,
    resposta TEXT,
    diasASerRevisto int,
    tags TEXT,
    folderId INT,
    FOREIGN KEY (folderId)
      REFERENCES folder (id)
  ); """;
}
