import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_state.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/episode_success_widget.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rick and Morty',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/history'),
            icon: Icon(Icons.history, size: 32, color: Colors.orange),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchWidget(controller: controller),
            const SizedBox(height: 16),

            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<EpisodeCubit, EpisodeState>(
                builder: (_, state) {
                  if (state is EpisodeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is EpisodeError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is EpisodeSuccess) {
                    return EpisodesSuccessWidget(episode: state.episode);
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
