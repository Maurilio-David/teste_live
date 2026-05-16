import 'package:teste_live/core/result/failure.dart';
import 'package:teste_live/core/result/result.dart';
import 'package:teste_live/feature/home/data/datasource/episodes_local_datasource.dart';
import 'package:teste_live/feature/home/data/datasource/episodes_remote_datasource.dart';
import 'package:teste_live/feature/home/domain/entities/episode_entity.dart';
import 'package:teste_live/feature/home/domain/repositories/episodes_repository.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesRemoteDatasource remoteDatasource;
  final EpisodesLocalDatasource localDatasource;

  EpisodesRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Result<EpisodeEntity, Failure>> getEpisode(int id) async {
    try {
      final episode = await remoteDatasource.getEpisode(id);

      await localDatasource.saveEpisode(episode);

      return Success(episode);
    } catch (_) {
      final localEpisode = await localDatasource.getEpisode(id);

      if (localEpisode != null) {
        return Success(localEpisode);
      }

      return Error(Failure('Erro ao buscar episódio'));
    }
  }

  @override
  Future<List<EpisodeEntity>> getEpisodesHistory() async {
    return localDatasource.getEpisodesHistory();
  }
}
