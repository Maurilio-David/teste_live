import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:teste_live/core/result/failure.dart';
import 'package:teste_live/core/result/result.dart';
import 'package:teste_live/feature/episodes/domain/entities/character_entity.dart';
import 'package:teste_live/feature/episodes/domain/entities/episode_entity.dart';
import 'package:teste_live/feature/episodes/domain/repositories/episodes_repository.dart';
import 'package:teste_live/feature/episodes/domain/usecases/get_episode_usecase.dart';

class MockEpisodesRepository extends Mock implements EpisodesRepository {}

void main() {
  late EpisodesRepository repository;

  late GetEpisodeUsecase usecase;

  setUp(() {
    repository = MockEpisodesRepository();

    usecase = GetEpisodeUsecase(repository);
  });

  const mockEpisode = EpisodeEntity(
    id: 1,
    name: 'Pilot',
    characters: [
      CharacterEntity(id: 1, name: 'Rick Sanchez', image: 'image_url'),
    ],
  );

  group('GetEpisodeUsecase', () {
    test('should return episode when repository succeeds', () async {
      when(
        () => repository.getEpisode(1),
      ).thenAnswer((_) async => Success(mockEpisode));

      final result = await usecase(1);

      expect(result, isA<Success<EpisodeEntity, Failure>>());

      verify(() => repository.getEpisode(1)).called(1);
    });

    test('should return failure when repository fails', () async {
      when(
        () => repository.getEpisode(1),
      ).thenAnswer((_) async => Error(Failure('Erro ao buscar episódio')));

      final result = await usecase(1);

      expect(result, isA<Error<EpisodeEntity, Failure>>());

      verify(() => repository.getEpisode(1)).called(1);
    });
  });
}
