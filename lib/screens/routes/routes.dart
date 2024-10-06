import 'package:go_router/go_router.dart';
import 'package:patitas/screens/pageInicio.dart';
import 'package:patitas/screens/pageRegistrar.dart';

GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Pageinicio(),
    ),
    GoRoute(
      path: '/registrarse',
      builder: (context, state) => const PageRegistrar(),
    ),
  ],
);

void cambiarPantalla(String route, context) {
  switch (route) {
    case "inicio":
      GoRouter.of(context).go("/");
    case "registrarse":
      GoRouter.of(context).go("/registrarse");

    default:
      GoRouter.of(context).go("/");
  }
}
