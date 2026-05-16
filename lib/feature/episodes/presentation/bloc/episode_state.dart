import 'package:equatable/equatable.dart';

import '../../domain/entities/episode_entity.dart';

sealed class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object?> get props => [];
}

final class EpisodeInitial extends EpisodeState {
  const EpisodeInitial();
}

final class EpisodeLoading extends EpisodeState {
  const EpisodeLoading();
}

final class EpisodeSuccess extends EpisodeState {
  final EpisodeEntity episode;

  const EpisodeSuccess(this.episode);

  @override
  List<Object?> get props => [episode];
}

final class EpisodeError extends EpisodeState {
  final String message;

  const EpisodeError(this.message);

  @override
  List<Object?> get props => [message];
}
