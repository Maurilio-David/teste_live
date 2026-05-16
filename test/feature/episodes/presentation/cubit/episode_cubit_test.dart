import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:teste_live/core/result/failure.dart';
import 'package:teste_live/core/result/result.dart';
import 'package:teste_live/feature/episodes/domain/entities/character_entity.dart';
import 'package:teste_live/feature/episodes/domain/entities/episode_entity.dart';
import 'package:teste_live/feature/episodes/domain/usecases/get_episode_usecase.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_state.dart';

class MockGetEpisodeUsecase extends Mock implements GetEpisodeUsecase {}

void main() {
  late GetEpisodeUsecase usecase;

  late EpisodeCubit cubit;

  setUp(() {
    usecase = MockGetEpisodeUsecase();

    cubit = EpisodeCubit(usecase);
  });

  const mockEpisode = EpisodeEntity(
    id: 1,
    name: 'Pilot',
    characters: [
      CharacterEntity(id: 1, name: 'Rick Sanchez', image: 'image_url'),
    ],
  );

  blocTest<EpisodeCubit, EpisodeState>(
    'should emit loading and success',
    build: () {
      when(() => usecase(1)).thenAnswer((_) async => Success(mockEpisode));

      return cubit;
    },
    act: (cubit) {
      cubit.getEpisode(1);
    },
    expect: () => [EpisodeLoading(), EpisodeSuccess(mockEpisode)],
  );

  blocTest<EpisodeCubit, EpisodeState>(
    'should emit loading and error',
    build: () {
      when(() => usecase(1)).thenAnswer((_) async => Error(Failure('Erro')));

      return cubit;
    },
    act: (cubit) {
      cubit.getEpisode(1);
    },
    expect: () => [EpisodeLoading(), EpisodeError('Erro')],
  );
}
