import 'package:flutter/material.dart';
import 'package:teste_live/feature/episodes/domain/entities/episode_entity.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/character_tile.dart';

class EpisodesSuccessWidget extends StatelessWidget {
  const EpisodesSuccessWidget({required this.episode, super.key});

  final EpisodeEntity episode;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            episode.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),

        ...episode.characters.map((character) {
          return CharacterTile(character: character);
        }),
      ],
    );
  }
}
