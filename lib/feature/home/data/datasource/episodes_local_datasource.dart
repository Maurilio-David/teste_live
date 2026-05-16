import 'package:teste_live/feature/home/data/models/episode_model.dart';

abstract class EpisodesLocalDatasource {
  Future<void> saveEpisode(EpisodeModel episode);

  Future<EpisodeModel?> getEpisode(int id);
  Future<List<EpisodeModel>> getEpisodesHistory();
}
