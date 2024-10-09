import 'package:patitas/data/adaptador.dart';
import 'package:patitas/entidades/usuario.dart';
import 'package:patitas/screens/routes/routes.dart';

class AdminsPatitas {
  void registrarse(Usuario newUsuario) {
    adaptador.guardaDatosMemoria(newUsuario);
  }

  void iniciarSesion(context) {
    cambiarPantalla("menu", context);
  }

  void adoptar() {}

  void transitar() {}
}
