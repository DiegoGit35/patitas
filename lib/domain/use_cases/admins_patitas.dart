import 'package:patitas/data/adaptador.dart';
import 'package:patitas/entidades/usuario.dart';
import 'package:patitas/config/routes/routes.dart';

import '../entities/caso.dart';

class AdminsPatitas {
  void registrarse(Usuario newUsuario) {
    adaptador.guardaDatosMemoria(newUsuario);
  }

  void iniciarSesion(context) {
    cambiarPantalla("menu", context);
  }

  void adoptar() {}

  void transitar() {}

   registrarNuevoCaso() {}

  registrarResolucionDeCaso(Caso caso, Usuario usuarioAdoptante) {}

  getCasosDeAdopcionNoResueltos() {}

  getCasosDeAdopcionResueltos() {}

  getCasosDeTransitoResueltos() {}
}
