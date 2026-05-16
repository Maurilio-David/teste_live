import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_live/core/result/result.dart';
import 'package:teste_live/feature/episodes/domain/usecases/get_episode_usecase.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  final GetEpisodeUsecase usecase;

  EpisodeCubit(this.usecase) : super(EpisodeInitial());

  Future<void> getEpisode(int id) async {
    emit(EpisodeLoading());

    final result = await usecase(id);

    switch (result) {
      case Success():
        emit(EpisodeSuccess(result.value));

      case Error():
        emit(EpisodeError(result.error.message));
    }
  }
}
