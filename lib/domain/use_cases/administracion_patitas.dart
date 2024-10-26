import 'package:patitas/data/repository_impl/repositorio_usuario_impl.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';

import '../entities/caso.dart';

class AdministracionPatitas {
  RepositorioUsuario repoUsuario = RepositorioUsuarioImpl();
  Future<String> registrarse(String nombre, String apellido, String email,
      String telefono, String password, DateTime fechaNa, String genero) async {
    int yearMax = 2023 - 18;

    if (nombre.isEmpty ||
        apellido.isEmpty ||
        email.isEmpty ||
        telefono.isEmpty ||
        password.isEmpty ||
        genero.isEmpty) {
      return "casillas";
    }

    if (fechaNa.year >= yearMax) {
      return "year";
    }

    if (await repoUsuario.getUsuarioByEmail(email) || await repoUsuario.getUsuarioByTelefono(telefono)) {
      return "registrado";
    }

    repoUsuario.agregarUsuario(Usuario(
      nombre: nombre,
      apellido: apellido,
      fechaNacimiento: fechaNa,
      email: email,
      telefono: telefono,
      contrasenia: password,
      sexo: genero,
    ));

    return "bien";
  }

  String iniciarSesion(String numeroEmail, String password) {
    return "";
  }

  Future<List<Usuario>> getTodosLosUsuariosActivos() async {
    List<Usuario> usuarios = await repoUsuario.todosLosUsuarios();
    return usuarios;
  }

  void adoptar() {}

  void transitar() {}

  registrarNuevoCaso() {}

  registrarResolucionDeCaso(Caso caso, Usuario usuarioAdoptante) {}

  getCasosDeAdopcionNoResueltos() {}

  getCasosDeAdopcionResueltos() {}

  getCasosDeTransitoResueltos() {}
}
