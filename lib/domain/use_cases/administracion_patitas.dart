import 'package:patitas/data/repository_impl/repositorio_usuario_impl.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';

import '../entities/caso.dart';

class AdministracionPatitas {
  RepositorioUsuario repoUsuario = RepositorioUsuarioImpl();

  String registrarse(String nombre, String apellido, String telefonoOEmail,
      String password, DateTime fechaNa, String genero) {
    int yearMax = 2023 - 18;
    if (nombre.isEmpty ||
        apellido.isEmpty ||
        telefonoOEmail.isEmpty ||
        password.isEmpty ||
        genero.isEmpty) {
      return "casillas";
    }

    if (fechaNa.year >= yearMax) {
      return "year";
    }

    repoUsuario.agregarUsuario(Usuario(
      nombre: nombre,
      apellido: apellido,
      fechaNacimiento: fechaNa,
      email: telefonoOEmail,
      contrasenia: password,
      sexo: genero,
    ));
    return "bien";
  }

  String iniciarSesion(String numeroEmail, String password) {
    return "";
  }

  void adoptar() {}

  void transitar() {}

  registrarNuevoCaso() {}

  registrarResolucionDeCaso(Caso caso, Usuario usuarioAdoptante) {}

  getCasosDeAdopcionNoResueltos() {}

  getCasosDeAdopcionResueltos() {}

  getCasosDeTransitoResueltos() {}
}
