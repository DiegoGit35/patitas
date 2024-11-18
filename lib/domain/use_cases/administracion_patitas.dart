import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patitas/data/repository_impl/repositorio_usuario_impl.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/enums/estado_de_caso.dart';
import 'package:patitas/domain/enums/tipo_de_caso.dart';
import 'package:patitas/domain/repository/repositorio_caso.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';

import '../../data/adaptador.dart';
import '../../data/repository_impl/repositorio_caso_impl.dart';
import '../entities/caso.dart';

class AdministracionPatitas {
  RepositorioUsuario repoUsuario = RepositorioUsuarioImpl();
  RepositorioCaso repoCaso = RepositorioCasoImpl();
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

  Future<String> adoptar(Caso unCaso) async {
    print("entrando a funcion adoptar");
    List<Caso> listaCasos = await repoCaso.todosLosCasosPendientes();
    for (Caso casoBD in listaCasos) {
      if (casoBD.idCaso == unCaso.idCaso) {
        repoCaso.actualizarDatosCasos("estado", "adoptado", unCaso.idCaso!);
        return "bien";
      }
    }
    return "YaAdoptado";
  }

  Future<String> transitar(Caso unCaso) async {
    print("entrando a funcion adoptar");
    List<Caso> listaCasos = await repoCaso.todosLosTransitosPendientes();
    for (Caso casoBD in listaCasos) {
      if (casoBD.idCaso == unCaso.idCaso) {
        repoCaso.actualizarDatosCasos("estado", "transitado", unCaso.idCaso!);
        return "bien";
      }
    }
    return "YaAdoptado";
  }

  Future<String> registrarNuevoCaso({
    required String direccion,
    required String distrito,
    required String contacto,
    required TipoDeCaso tipoDeCaso,
    required String emailUsuarioRegistrante,
  }) async {
    if (direccion.isEmpty || contacto.isEmpty) {
      return "casillas";
    }

    repoCaso.agregarCaso(
      Caso(
        direccion: direccion,
        distrito: distrito,
        contacto: contacto,
        foto: "assets/imagenes/3.jpg",
        tipoDeCaso: tipoDeCaso,
        usuarioRegistrante: emailUsuarioRegistrante,
        fechaRegistro: DateTime.now().toString(),
      ),
    );

    return 'bien';
  }

  registrarResolucionDeCaso(Caso caso, Usuario usuarioAdoptante) {}

  Future<List<Caso>> getCasosDeAdopcionNoResueltos() {
    return repoCaso.todosLosAdopcionPendientes();
  }

  getCasosDeAdopcionResueltos() {}

  getCasosDeTransitoResueltos() {}

  Future<List<Caso>> getCasosDeTransitoNoResultos() {
    return repoCaso.todosLosTransitosPendientes();
  }
}
