const String episodeTableName = "episodes";

const String episodeTableId = "id";
const String episodeTableNameColumn = "name";

const String createEpisodeTable = '''
CREATE TABLE $episodeTableName(
  $episodeTableId INTEGER PRIMARY KEY,
  $episodeTableNameColumn TEXT NOT NULL
)
''';
