import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_live/feature/episodes/domain/entities/character_entity.dart';
import 'package:teste_live/feature/episodes/domain/entities/episode_entity.dart';
import 'package:teste_live/feature/episodes/domain/repositories/episodes_repository.dart';
import 'package:teste_live/feature/episodes/domain/usecases/get_episode_history.dart';

class MockEpisodesRepository extends Mock implements EpisodesRepository {}

void main() {
  late EpisodesRepository repository;

  late GetEpisodesHistoryUsecase usecase;

  setUp(() {
    repository = MockEpisodesRepository();

    usecase = GetEpisodesHistoryUsecase(repository);
  });

  const mockEpisodes = [
    EpisodeEntity(
      id: 1,
      name: 'Pilot',
      characters: [
        CharacterEntity(id: 1, name: 'Rick Sanchez', image: 'image_url'),
      ],
    ),
  ];

  group('GetEpisodesHistoryUsecase', () {
    test('should return episodes history', () async {
      when(
        () => repository.getEpisodesHistory(),
      ).thenAnswer((_) async => mockEpisodes);

      final result = await usecase();

      expect(result, mockEpisodes);

      verify(() => repository.getEpisodesHistory()).called(1);
    });
  });
}
