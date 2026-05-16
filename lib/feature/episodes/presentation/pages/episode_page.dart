import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_state.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/episode_success_widget.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/error_page_widget.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/loading_page_widget.dart';

class EpisodePage extends StatefulWidget {
  final int episodeId;

  const EpisodePage({super.key, required this.episodeId});

  @override
  State<EpisodePage> createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  @override
  void initState() {
    super.initState();

    context.read<EpisodeCubit>().getEpisode(widget.episodeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.orange),
        title: Text(
          'Episódio ${widget.episodeId}',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<EpisodeCubit, EpisodeState>(
        builder: (_, state) {
          if (state is EpisodeLoading) {
            return PageLoadingWidget();
          }

          if (state is EpisodeError) {
            return PageErrorWidget(message: state.message);
          }

          if (state is EpisodeSuccess) {
            return EpisodesSuccessWidget(episode: state.episode);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
