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
      "idUsuario": nuevoUsuario.idUsuario,
      "nombre": nuevoUsuario.nombre,
      "apellido": nuevoUsuario.apellido,
      "fechaNacimiento": nuevoUsuario.fechaNacimiento,
      "fechaDeBaja": nuevoUsuario.fechaDeBaja,
      "email": nuevoUsuario.email,
      "contrasenia": nuevoUsuario.contrasenia,
      "foto": "assets/default-avatar.png",
      "sexo": nuevoUsuario.sexo,
      "tipo": nuevoUsuario.tipo == TipoDeUsuario.administrador
          ? "administrador"
          : "normal"
      // "direccion": nuevoUsuario.direccion,
      // "distrito": nuevoUsuario.distrito,
      // "telefono": nuevoUsuario.telefono,
      // "tipo": nuevoUsuario.tipo,
      // "dni": nuevoUsuario.dni,
    };

    // await coleccionUsuarios.add(usuario);

    DocumentReference documentReference = await coleccionUsuarios.add(usuario);
    await documentReference.update({"idUsuario": documentReference.id});
  }

  @override
  void bajarUsuario(String usuarioId) async {
    // print("hola desde admins");
    DateTime fechaDeBaja = DateTime.now();
    await coleccionUsuarios.doc(usuarioId).update({"fechaDeBaja": fechaDeBaja});
    // print("usuario dado de baja a las ${fechaDeBaja.toString()}");
  }

  @override
  void activarUsuario(String usuarioId) async {
    await coleccionUsuarios.doc(usuarioId).update({"fechaDeBaja": null});
  }

  @override
  Future<Usuario> getUsuarioById(String usuarioId) {
    // TODO: implement getUsuarioById
    throw UnimplementedError();
  }

  @override
  Future<List<Usuario>> todosLosUsuarios() async {
    QuerySnapshot snapshot = await coleccionUsuarios.get();
    return snapshot.docs
        .map((doc) => Usuario.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Usuario>> todosLosUsuariosActivos() async {
    QuerySnapshot snapshot =
        await coleccionUsuarios.where("fechaDeBaja", isEqualTo: null).get();
    return snapshot.docs
        .map((doc) => Usuario.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> usuarioExiste({String? email, String? telefono}) async {
    try {
      QuerySnapshot query;
      if (email!.isNotEmpty) {
        query = await coleccionUsuarios
            .where("email", isEqualTo: email)
            .limit(1)
            .get();
      } else {
        query = await coleccionUsuarios
            .where("telefono", isEqualTo: telefono)
            .limit(1)
            .get();
      }
      return query.docs.isNotEmpty;
    } catch (e) {
      print("Error al buscar usuario por: $e");
      return false;
    }
  }

  @override
  Future<Usuario> getUsuarioByEmail(String email) async {
    try {
      QuerySnapshot query = await coleccionUsuarios
          .where("email", isEqualTo: email)
          .limit(1)
          .get();
      if (query.docs.isNotEmpty) {
        Map<String, dynamic> userData =
            query.docs.first.data() as Map<String, dynamic>;
        Usuario usr = await Usuario.fromMap(userData);
        return usr;
      } else {
        throw Exception("Usuario no encontrado");
      }
    } catch (e) {
      print("Error al buscar usuario por email: $e");
      throw Exception("Error al buscar usuario");
    }
  }
}
