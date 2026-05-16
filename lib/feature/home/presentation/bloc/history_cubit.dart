import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_live/feature/home/domain/usecases/get_episode_history.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final GetEpisodesHistoryUsecase usecase;

  HistoryCubit(this.usecase) : super(HistoryInitial());

  Future<void> getHistory() async {
    try {
      emit(HistoryLoading());

      final result = await usecase();

      emit(HistorySuccess(result));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}
