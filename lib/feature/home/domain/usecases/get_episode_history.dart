import '../entities/episode_entity.dart';
import '../repositories/episodes_repository.dart';

class GetEpisodesHistoryUsecase {
  final EpisodesRepository repository;

  GetEpisodesHistoryUsecase(this.repository);

  Future<List<EpisodeEntity>> call() async {
    return repository.getEpisodesHistory();
  }
}
