import 'package:get_it/get_it.dart';
import 'package:teste_live/core/dio/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient());
}
