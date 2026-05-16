const String characterTableName = "characters";

const String characterTableId = "id";
const String characterTableEpisodeId = "episode_id";
const String characterTableNameColumn = "name";
const String characterTableImage = "image";

const String createCharacterTable = '''
CREATE TABLE $characterTableName(
  $characterTableId INTEGER PRIMARY KEY,
  $characterTableEpisodeId INTEGER NOT NULL,
  $characterTableNameColumn TEXT NOT NULL,
  $characterTableImage TEXT NOT NULL
)
''';
