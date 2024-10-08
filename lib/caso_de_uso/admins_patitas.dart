import 'package:patitas/data/adaptador.dart';
import 'package:patitas/entidades/usuario.dart';

class AdminsPatitas {
  void registrarse(Usuario newUsuario) {
    adaptador.guardaDatosMemoria(newUsuario);
  }

  void iniciarSesion() {}
}
