import 'package:patitas/data/repository_impl/repositorio_usuario_impl.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';
import 'package:patitas/domain/use_cases/user_manager.dart';

import '../../data/adaptador.dart';
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

    if (await repoUsuario.usuarioExiste(email: email) ||
        await repoUsuario.usuarioExiste(telefono: telefono)) {
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

  Future<String> iniciarSesion(String numeroEmail, String password) async {
    if (numeroEmail.isEmpty || password.isEmpty) {
      return "casillas";
    }
    Usuario usuarioBuscado = await repoUsuario.getUsuarioByEmail(numeroEmail);
    if (usuarioBuscado.email!.isNotEmpty) {
      if (password == usuarioBuscado.contrasenia) {
        // final sessionManager = SessionManager();
        await session.saveUserId("${usuarioBuscado.email}");
        // print("from CU: ${await session.getUserId()}");
        return "bien";
      } else {
        return "passNull";
      }
    } else {
      return "usuarioNull";
    }
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
