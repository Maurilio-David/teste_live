import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:teste_live/core/di/injetor_container.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/history_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/pages/episode_page.dart';
import 'package:teste_live/feature/episodes/presentation/pages/history_page.dart';
import 'package:teste_live/feature/episodes/presentation/pages/home_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) {
        return BlocProvider(
          create: (_) => sl<EpisodeCubit>(),
          child: const HomePage(),
        );
      },
    ),

    GoRoute(
      path: '/history',
      builder: (_, __) {
        return BlocProvider(
          create: (_) => sl<HistoryCubit>(),
          child: const HistoryPage(),
        );
      },
    ),

    GoRoute(
      path: '/episode/:id',
      builder: (_, state) {
        final id = int.parse(state.pathParameters['id']!);

        return BlocProvider(
          create: (_) => sl<EpisodeCubit>(),
          child: EpisodePage(episodeId: id),
        );
      },
    ),
  ],
);
