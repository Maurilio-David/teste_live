const String episodeTableName = "character";
const String episodeTableId = "id";
const String episodeTableCharacter = "character";

const String createHabitsTable = '''CREATE TABLE $episodeTableName(
          $episodeTableId TEXT PRIMARY KEY,
          $episodeTableCharacter TEXT NOT NULL,
        )''';
