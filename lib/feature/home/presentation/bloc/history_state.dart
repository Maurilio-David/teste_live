import 'package:equatable/equatable.dart';

import '../../domain/entities/episode_entity.dart';

sealed class HistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistorySuccess extends HistoryState {
  final List<EpisodeEntity> episodes;

  HistorySuccess(this.episodes);

  @override
  List<Object?> get props => [episodes];
}

final class HistoryError extends HistoryState {
  final String message;

  HistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
