import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_live/feature/episodes/domain/entities/character_entity.dart';
import 'package:teste_live/feature/episodes/domain/entities/episode_entity.dart';
import 'package:teste_live/feature/episodes/domain/usecases/get_episode_history.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/history_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/history_state.dart';

class MockGetEpisodesHistoryUsecase extends Mock
    implements GetEpisodesHistoryUsecase {}

void main() {
  late GetEpisodesHistoryUsecase usecase;

  late HistoryCubit cubit;

  setUp(() {
    usecase = MockGetEpisodesHistoryUsecase();

    cubit = HistoryCubit(usecase);
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

  blocTest<HistoryCubit, HistoryState>(
    'should emit loading and success',
    build: () {
      when(() => usecase()).thenAnswer((_) async => mockEpisodes);

      return cubit;
    },
    act: (cubit) {
      cubit.getHistory();
    },
    expect: () => [HistoryLoading(), HistorySuccess(mockEpisodes)],
  );
}
