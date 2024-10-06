import 'package:go_router/go_router.dart';
import 'package:patitas/screens/pageData.dart';
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
    GoRoute(
      path: '/data',
      builder: (context, state) => const Pagedata(),
    ),
  ],
);

void cambiarPantalla(String route, context) {
  switch (route) {
    case "inicio":
      GoRouter.of(context).go("/");
    case "registrarse":
      GoRouter.of(context).go("/registrarse");
    case "data":
      GoRouter.of(context).go("/data");
    default:
      GoRouter.of(context).go("/");
  }
}
