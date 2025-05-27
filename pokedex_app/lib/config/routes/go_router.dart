import 'package:go_router/go_router.dart';
import 'package:pokedex_app/presentation/screens/auth/home_screen.dart';
import 'package:pokedex_app/presentation/screens/unauth/index_screen.dart';
import 'package:pokedex_app/presentation/screens/unauth/loading_screen.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/loading',
  routes: [
    GoRoute(
      path: '/loading',
      name: 'loading',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/index',
      name: 'index',
      builder: (context, state) => const IndexScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
