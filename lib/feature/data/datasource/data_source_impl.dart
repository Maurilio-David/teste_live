import 'package:teste_live/feature/data/models/characters.dart';
import 'package:teste_live/feature/data/models/episode.dart';

class DataSourceImpl implements DataSource {
  @override
  Future<List<Characters>> getCharacters() {
    return [];
  }

  @override
  Future<List<Episode>> getEpisodes() {}
}
