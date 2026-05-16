import 'package:teste_live/feature/home/data/datasource/episodes_remote_datasource.dart';

import '../../../../core/dio/dio_client.dart';
import '../models/characters_model.dart';
import '../models/episode_model.dart';

class EpisodesRemoteDatasourceImpl implements EpisodesRemoteDatasource {
  final DioClient client;

  EpisodesRemoteDatasourceImpl(this.client);

  @override
  Future<EpisodeModel> getEpisode(int id) async {
    final episodeResponse = await client.dio.get('/episode/$id');

    final List charactersUrls = episodeResponse.data['characters'];

    final characterIds = charactersUrls
        .map((e) => e.toString().split('/').last)
        .join(',');

    final characterResponse = await client.dio.get('/character/$characterIds');

    final characters =
        (characterResponse.data as List)
            .map((e) => CharacterModel.fromMap(e))
            .toList();

    return EpisodeModel.fromMap(episodeResponse.data, characters);
  }
}
