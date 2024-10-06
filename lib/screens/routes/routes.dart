import 'package:go_router/go_router.dart';
import 'package:patitas/screens/pageInicio.dart';

GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Pageinicio(),
    ),
  ],
);
