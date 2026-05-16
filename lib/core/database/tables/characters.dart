const String characterTableName = "character";
const String characterTableId = "id";
const String characterTableImage = "image";

const String createHabitsTable = '''CREATE TABLE $characterTableName(
          $characterTableId TEXT PRIMARY KEY,
          $characterTableImage TEXT NOT NULL,
        )''';
