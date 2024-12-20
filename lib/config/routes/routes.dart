import 'package:go_router/go_router.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/presentation/pages/fechatest.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/pages/pageCaso.dart';
import 'package:patitas/presentation/pages/pageData.dart';
import 'package:patitas/presentation/pages/pageInicio.dart';
import 'package:patitas/presentation/pages/pageInicioSesion.dart';
import 'package:patitas/presentation/pages/pageMenu.dart';
import 'package:patitas/presentation/pages/pageRegisterAnimal.dart';
import 'package:patitas/presentation/pages/pageTransitar.dart';
import 'package:patitas/presentation/pages/page_admiduser.dart';
import 'package:patitas/presentation/pages/page_anUser.dart';
import 'package:patitas/presentation/pages/page_busqueda.dart';

import '../../presentation/pages/pageRegistrar.dart';

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
      builder: (context, state) => const PageAdopcion(),
    ),
    GoRoute(
      path: '/transitar',
      builder: (context, state) => const Pagetransitar(),
    ),
    GoRoute(
      path: '/registrarAnimal',
      builder: (context, state) => const Pageregisteranimal(),
    ),
    GoRoute(
      // final String message = state.extra as String;
      path: '/adminsUser',
      builder: (context, state) => const PageAdmiduser(),
    ),
    GoRoute(
      path: '/usuario',
      builder: (context, state) {
        final Usuario usuario = state.extra as Usuario;
        return PageAnuser(usuario: usuario);
      },
    ),
    GoRoute(
      path: '/busqueda',
      builder: (context, state) => const PageBusqueda(),
    ),
    // GoRoute(
    //   path: '/caso',
    //   builder: (context, state) => Pagecaso(unCaso: ,),
    // ),
    // GoRoute(
    //   path: '/fechatest',
    //   builder: (context, state) => const Fechatest(),
    // ),
  ],
);

void cambiarPantalla(String route) {
  print("cambiar pantalla");
  router.go("/$route");
}
