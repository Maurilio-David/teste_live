import 'package:teste_live/feature/home/domain/entities/episode_entity.dart';

sealed class EpisodeState extends Equatable {
  List<Object?> get props => [];
}

class Equatable {}

final class EpisodeInitial extends EpisodeState {}

final class EpisodeLoading extends EpisodeState {}

final class EpisodeSuccess extends EpisodeState {
  final EpisodeEntity episode;

  EpisodeSuccess(this.episode);

  @override
  List<Object?> get props => [episode];
}

final class EpisodeError extends EpisodeState {
  final String message;

  EpisodeError(this.message);

  @override
  List<Object?> get props => [message];
}
