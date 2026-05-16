import 'package:teste_live/feature/home/data/datasource/episodes_local_datasource.dart';
import 'package:teste_live/feature/home/data/models/episode_model.dart';

class EpisodesLocalDatasourceImpl implements EpisodesLocalDatasource {
  EpisodeModel? cache;

  @override
  Future<void> saveEpisode(EpisodeModel episode) async {
    cache = episode;
  }

  @override
  Future<EpisodeModel?> getEpisode(int id) async {
    return cache;
  }
}
