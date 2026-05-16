import 'package:teste_live/feature/home/data/models/episode_model.dart';

abstract class EpisodesRemoteDatasource {
  Future<EpisodeModel> getEpisode(int id);
}
