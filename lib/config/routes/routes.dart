import 'package:go_router/go_router.dart';
import 'package:patitas/presentation/pages/fechatest.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/pages/pageData.dart';
import 'package:patitas/presentation/pages/pageInicio.dart';
import 'package:patitas/presentation/pages/pageInicioSesion.dart';
import 'package:patitas/presentation/pages/pageMenu.dart';
import 'package:patitas/presentation/pages/pageRegistrar.dart';
import 'package:patitas/presentation/pages/pageTransitar.dart';

GoRouter router = GoRouter(
  initialLocation: "/inicio",
  routes: [
    GoRoute(
      path: '/inicio',
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
      builder: (context, state) => const PageMenu(),
    ),
    GoRoute(
      path: '/adopcion',
      builder: (context, state) => const Pageadopcion(),
    ),
    GoRoute(
      path: '/transitar',
      builder: (context, state) => const Pagetransitar(),
    ),
    GoRoute(
      path: '/fechatest',
      builder: (context, state) => const Fechatest(),
    ),
  ],
);

void cambiarPantalla(String route) {
  router.go("/$route");
}
