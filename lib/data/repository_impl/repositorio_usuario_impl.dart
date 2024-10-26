import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';

class RepositorioUsuarioImpl implements RepositorioUsuario {
  CollectionReference coleccionUsuarios =
      FirebaseFirestore.instance.collection("Usuario");

  @override
  Future<void> agregarUsuario(Usuario nuevoUsuario) async {
    Map<String, dynamic> usuario = {
      "nombre": nuevoUsuario.nombre,
      "apellido": nuevoUsuario.apellido,
      "fechaNacimiento": nuevoUsuario.fechaNacimiento,
      "email": nuevoUsuario.email,
      "contrasenia": nuevoUsuario.contrasenia,
      "foto": "assets/default-avatar.png",
      "sexo": nuevoUsuario.sexo,
      // "direccion": nuevoUsuario.direccion,
      // "distrito": nuevoUsuario.distrito,
      // "telefono": nuevoUsuario.telefono,
      // "tipo": nuevoUsuario.tipo,
      // "dni": nuevoUsuario.dni,
    };

    await coleccionUsuarios.add(usuario);
  }

  @override
  void bajarUsuario(int usuarioId) {
    // TODO: implement bajarUsuario
  }

  @override
  Future<Usuario> getUsuarioById(int usuarioId) {
    // TODO: implement getUsuarioById
    throw UnimplementedError();
  }

  @override
  Future<List<Usuario>> todosLosUsuarios() async {
    return (await coleccionUsuarios.get())
        .docs
        .map((element) => element.data() as Map<String, dynamic>)
        .map((dict) => Usuario(
            idUsuario: dict["idUsuario"],
            nombre: dict["nombre"],
            apellido: dict["apellido"],
            foto: dict["foto"],
            fechaNacimiento: (dict["fechaNacimiento"] as Timestamp).toDate(),
            email: dict["email"],
            contrasenia: dict["contrasenia"],
            direccion: dict["direccion"],
            distrito: dict["distrito"],
            telefono: dict["telefono"],
            tipo: dict["tipo"] ?? TipoDeUsuario.normal,
            dni: dict["dni"],
            sexo: dict["sexo"]))
        .toList();
  }

  @override
  Future<List<Usuario>> todosLosUsuariosActivos() {
    // TODO: implement todosLosUsuariosActivos
    throw UnimplementedError();
  }

  @override
  Future<bool> getUsuarioByEmail(String email) async {
    try {
      QuerySnapshot query = await coleccionUsuarios
          .where("email", isEqualTo: email)
          .limit(1)
          .get();
      return query.docs.isNotEmpty;
    } catch (e) {
      print("Error al buscar usuario por email: $e");
      return false;
    }
  }

  @override
  Future<bool> getUsuarioByTelefono(String telefono) async {
    try {
      QuerySnapshot query = await coleccionUsuarios
          .where("telefono", isEqualTo: telefono)
          .limit(1)
          .get();
      return query.docs.isNotEmpty;
    } catch (e) {
      print("Error al buscar usuario por telefono: $e");
      return false;
    }
  }
}
