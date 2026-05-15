import 'package:go_router/go_router.dart';
import 'package:teste_live/feature/presentation/home_page.dart';

final router = GoRouter(
  routes: [GoRoute(path: '/', builder: (_, __) => const HomePage())],
);
