import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patitas/data/repository_impl/repositorio_usuario_impl.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/enums/estado_de_caso.dart';
import 'package:patitas/domain/enums/mensages_login.dart';
import 'package:patitas/domain/enums/mensages_register.dart';
import 'package:patitas/domain/enums/tipo_de_caso.dart';
import 'package:patitas/domain/repository/repositorio_caso.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';

import '../../data/adaptador.dart';
import '../../data/repository_impl/repositorio_caso_impl.dart';
import '../entities/caso.dart';

class AdministracionPatitas {
  RepositorioUsuario repoUsuario = RepositorioUsuarioImpl();
  RepositorioCaso repoCaso = RepositorioCasoImpl();

  Future<List<Usuario>> getTodosLosUsuariosRegistrados() async {
    return repoUsuario.todosLosUsuarios();
  }

  Future<EstadoRegistro> registrarse(
      String nombre,
      String apellido,
      String email,
      String telefono,
      String password,
      DateTime fechaNa,
      String genero) async {
    int yearMax = 2023 - 18;

    if (nombre.isEmpty ||
        apellido.isEmpty ||
        email.isEmpty ||
        telefono.isEmpty ||
        password.isEmpty ||
        genero.isEmpty) {
      return EstadoRegistro.casillasVacias;
    }

    if (fechaNa.year >= yearMax) {
      return EstadoRegistro.aniosMenor;
    }

    if (await repoUsuario.usuarioExiste(email: email) ||
        await repoUsuario.usuarioExiste(telefono: telefono)) {
      return EstadoRegistro.cuentaYaRegistrada;
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

    return EstadoRegistro.cuentaRegistrada;
  }

  Future<EstadoLogin> iniciarSesion(String numeroEmail, String password) async {
    if (numeroEmail.isEmpty || password.isEmpty) {
      return EstadoLogin.casillasVacias;
    }
    List<Usuario> usuariosBuscado = await repoUsuario.todosLosUsuarios();
    // print(
    //     "-------------------------${usuariosBuscado[0].apellido}-------------------------");
    for (Usuario usuario in usuariosBuscado) {
      if (usuario.email == numeroEmail) {
        if (password == usuario.contrasenia) {
          // final sessionManager = SessionManager();
          if (usuario.fechaDeBaja != null) {
            return EstadoLogin.cuentaDesactivada;
          } else {
            await session.saveUserId("${usuario.email}");
            // print("from CU: ${await session.getUserId()}");
            return EstadoLogin.cuentaEncontrada;
          }
        } else {
          return EstadoLogin.contrasenaIncorrecta;
        }
      }
    }

    print("......................USUARIO ENCONTRADO.....................");
    return EstadoLogin.cuentaNoExiste;
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

  Future<List<Caso>> getTodosLosAnimalesPerdidos() {
    return repoCaso.todosLosCasosSeBusca();
  }

  void desactivarUnUsuario(Usuario unUsuario) {
    print(unUsuario.idUsuario);
    repoUsuario.bajarUsuario(unUsuario.idUsuario!);
  }

  void activarUnUsuario(Usuario unUsuario) {
    print(unUsuario.idUsuario);
    repoUsuario.activarUsuario(unUsuario.idUsuario!);
  }
}
