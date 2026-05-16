import 'package:teste_live/feature/episodes/data/models/characters_model.dart';
import 'package:teste_live/feature/episodes/domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    required super.id,
    required super.name,
    required super.characters,
  });
  factory EpisodeModel.fromMap(
    Map<String, dynamic> map,
    List<CharacterModel> characters,
  ) {
    return EpisodeModel(
      id: map['id'],
      name: map['name'],
      characters: characters,
    );
  }
}
