import 'package:equatable/equatable.dart';

import 'character_entity.dart';

class EpisodeEntity extends Equatable {
  final int id;
  final String name;
  final List<CharacterEntity> characters;

  const EpisodeEntity({
    required this.id,
    required this.name,
    required this.characters,
  });

  @override
  List<Object?> get props => [id, name, characters];
}
