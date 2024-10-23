import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';

class RepositorioUsuarioImpl implements RepositorioUsuario{
  CollectionReference coleccionUsuarios =
      FirebaseFirestore.instance.collection("Usuarios");
      
  @override
  void agregarUsuario(Usuario nuevoUsuario) async {
    Map<String, dynamic> usuario = {
      "nombre": nuevoUsuario.nombre,
      "apellido": nuevoUsuario.apellido,
      "foto": nuevoUsuario.foto,
      "fechaNacimiento": nuevoUsuario.fechaNacimiento,
      "email": nuevoUsuario.email,
      "contrasenia": nuevoUsuario.contrasenia,
      "direccion": nuevoUsuario.direccion,
      "distrito": nuevoUsuario.distrito,
      "telefono": nuevoUsuario.telefono,
      "tipo": nuevoUsuario.tipo,
      "dni": nuevoUsuario.dni,
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
              fechaNacimiento:  dict["fechaNacimiento"],
              email: dict["email"],
              contrasenia:  dict["contrasenia"],
              direccion:  dict["direccion"],
              distrito:  dict["distrito"],
              telefono:  dict["telefono"],
              tipo:  dict["tipo"],
              dni:  dict["dni"],
            ))
        .toList();
  }

  @override
  Future<List<Usuario>> todosLosUsuariosActivos() {
    // TODO: implement todosLosUsuariosActivos
    throw UnimplementedError();
  }

}