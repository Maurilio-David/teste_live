import 'package:teste_live/feature/episodes/data/models/episode_model.dart';

abstract class EpisodesRemoteDatasource {
  Future<EpisodeModel> getEpisode(int id);
}
