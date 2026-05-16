import 'package:teste_live/core/result/failure.dart';
import 'package:teste_live/core/result/result.dart';
import 'package:teste_live/feature/home/domain/entities/episode_entity.dart';
import 'package:teste_live/feature/home/domain/entities/repositories/episodes_repository.dart';

class GetEpisodeUsecase {
  final EpisodesRepository repository;

  GetEpisodeUsecase(this.repository);

  Future<Result<EpisodeEntity, Failure>> call(int id) async {
    return repository.getEpisode(id);
  }
}
