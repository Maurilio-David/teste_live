import 'package:teste_live/core/result/failure.dart';
import 'package:teste_live/core/result/result.dart';
import 'package:teste_live/feature/home/domain/entities/episode_entity.dart';

abstract class EpisodesRepository {
  Future<Result<EpisodeEntity, Failure>> getEpisode(int id);
  Future<List<EpisodeEntity>> getEpisodesHistory();
}
