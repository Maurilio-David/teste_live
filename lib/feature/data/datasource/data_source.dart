import 'package:teste_live/feature/data/models/episode.dart';

abstract class DataSource {
  Future<List<Episode>> getEpisodes();
  Future<List> getCharacters();
}
