import 'package:get_it/get_it.dart';
import 'package:teste_live/core/database/app_database.dart';
import 'package:teste_live/core/dio/dio_client.dart';
import 'package:teste_live/feature/episodes/data/datasource/episodes_local_datasource.dart';
import 'package:teste_live/feature/episodes/data/datasource/episodes_local_datasource_impl.dart';
import 'package:teste_live/feature/episodes/data/datasource/episodes_remote_datasource.dart';
import 'package:teste_live/feature/episodes/data/datasource/episodes_remote_datasource_impl.dart';
import 'package:teste_live/feature/episodes/data/repositories/episodes_repository_impl.dart';
import 'package:teste_live/feature/episodes/domain/repositories/episodes_repository.dart';
import 'package:teste_live/feature/episodes/domain/usecases/get_episode_history.dart';
import 'package:teste_live/feature/episodes/domain/usecases/get_episode_usecase.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/episode_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/history_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => EpisodeCubit(sl()));
  sl.registerFactory(() => HistoryCubit(sl()));

  // Usecase
  sl.registerLazySingleton(() => GetEpisodeUsecase(sl()));
  sl.registerLazySingleton(() => GetEpisodesHistoryUsecase(sl()));

  // Repository
  sl.registerLazySingleton<EpisodesRepository>(
    () => EpisodesRepositoryImpl(remoteDatasource: sl(), localDatasource: sl()),
  );

  // Datasource
  sl.registerLazySingleton<EpisodesRemoteDatasource>(
    () => EpisodesRemoteDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<EpisodesLocalDatasource>(
    () => EpisodesLocalDatasourceImpl(sl()),
  );

  // Core
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => AppDatabase());
}
