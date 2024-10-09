import 'package:go_router/go_router.dart';
import 'package:patitas/screens/pageAdopcion.dart';
import 'package:patitas/screens/pageData.dart';
import 'package:patitas/screens/pageInicio.dart';
import 'package:patitas/screens/pageInicioSesion.dart';
import 'package:patitas/screens/pageMenu.dart';
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
    GoRoute(
      path: '/login',
      builder: (context, state) => const Pageiniciosesion(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) => const Pagemenu(),
    ),
    GoRoute(
      path: '/adopcion',
      builder: (context, state) => const Pageadopcion(),
    ),
  ],
);

void cambiarPantalla(String route, context) {
  switch (route) {
    case "inicio":
      GoRouter.of(context).go("/");
    case "registrarse":
      GoRouter.of(context).go("/registrarse");
    case "login":
      GoRouter.of(context).go("/login");
    case "data":
      GoRouter.of(context).go("/data");
    case "menu":
      GoRouter.of(context).go("/menu");
    case "adopcion":
      GoRouter.of(context).go("/adopcion");
    default:
      GoRouter.of(context).go("/");
  }
}
