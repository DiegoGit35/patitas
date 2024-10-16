import 'package:go_router/go_router.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/pages/pageData.dart';
import 'package:patitas/presentation/pages/pageInicio.dart';
import 'package:patitas/presentation/pages/pageInicioSesion.dart';
import 'package:patitas/presentation/pages/pageMenu.dart';
import 'package:patitas/presentation/pages/pageRegistrar.dart';
import 'package:patitas/presentation/pages/pageTransitar.dart';

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
    GoRoute(
      path: '/transitar',
      builder: (context, state) => const Pagetransitar(),
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
    case "transitar":
      GoRouter.of(context).go("/transitar");
    default:
      GoRouter.of(context).go("/");
  }
}
