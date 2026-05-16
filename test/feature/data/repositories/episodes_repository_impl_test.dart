import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:teste_live/core/result/result.dart';
import 'package:teste_live/feature/episodes/data/datasource/episodes_local_datasource.dart';
import 'package:teste_live/feature/episodes/data/datasource/episodes_remote_datasource.dart';
import 'package:teste_live/feature/episodes/data/models/characters_model.dart';
import 'package:teste_live/feature/episodes/data/models/episode_model.dart';
import 'package:teste_live/feature/episodes/data/repositories/episodes_repository_impl.dart';

class MockRemoteDatasource extends Mock implements EpisodesRemoteDatasource {}

class MockLocalDatasource extends Mock implements EpisodesLocalDatasource {}

void main() {
  late EpisodesRepositoryImpl repository;

  late EpisodesRemoteDatasource remoteDatasource;

  late EpisodesLocalDatasource localDatasource;

  setUp(() {
    remoteDatasource = MockRemoteDatasource();

    localDatasource = MockLocalDatasource();

    repository = EpisodesRepositoryImpl(
      remoteDatasource: remoteDatasource,
      localDatasource: localDatasource,
    );
  });

  const mockEpisode = EpisodeModel(
    id: 1,
    name: 'Pilot',
    characters: [
      CharacterModel(id: 1, name: 'Rick Sanchez', image: 'image_url'),
    ],
  );

  test('should return remote episode', () async {
    // arrange

    when(
      () => remoteDatasource.getEpisode(1),
    ).thenAnswer((_) async => mockEpisode);

    when(
      () => localDatasource.saveEpisode(mockEpisode),
    ).thenAnswer((_) async {});

    // act

    final result = await repository.getEpisode(1);

    // assert

    expect(result, isA<Success>());

    verify(() => remoteDatasource.getEpisode(1)).called(1);

    verify(() => localDatasource.saveEpisode(mockEpisode)).called(1);
  });

  test('should return local episode when remote fails', () async {
    when(() => remoteDatasource.getEpisode(1)).thenThrow(Exception());

    when(
      () => localDatasource.getEpisode(1),
    ).thenAnswer((_) async => mockEpisode);

    final result = await repository.getEpisode(1);

    expect(result, isA<Success>());
  });
}
