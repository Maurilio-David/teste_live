import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teste_live/feature/home/domain/entities/episode_entity.dart';

class HistorySuccessPage extends StatelessWidget {
  const HistorySuccessPage({required this.episodes, super.key});

  final List<EpisodeEntity> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (_, index) {
        final episode = episodes[index];

        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(episode.name), Text(episode.id.toString())],
          ),
          onTap: () {
            context.push('/episode/${episode.id}');
          },
        );
      },
    );
  }
}
