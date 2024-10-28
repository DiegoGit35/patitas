import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/domain/enums/tipo_de_caso.dart';
import 'package:patitas/domain/repository/repositorio_caso.dart';

class RepositorioCasoImpl implements RepositorioCaso {
  CollectionReference coleccionCasos =
      FirebaseFirestore.instance.collection("Casos");

  @override
  void agregarCaso(Caso nuevoCaso) async {
    Map<String, dynamic> caso = {
      "idCaso": nuevoCaso.idCaso,
      "direccion": nuevoCaso.direccion,
      "contacto": nuevoCaso.contacto,
      "foto": nuevoCaso.foto,
      "fechaRegistro": DateTime.now().toString(),
      "tipoDeCaso": nuevoCaso.tipoDeCaso == TipoDeCaso.Adopcion
          ? "adopcion"
          : nuevoCaso.tipoDeCaso == TipoDeCaso.Transito
              ? "transito"
              : "busqueda",
      "usuarioRegistrante": nuevoCaso.usuarioRegistrante,
      "estado": "pendiente",
      // "fechaBaja": nuevoCaso.fechaBaja,
      // "fechaResolucion": nuevoCaso.fechaResolucion,
    };

    await coleccionCasos.add(caso);
  }

  @override
  void bajarCaso(int casoId) {
    // TODO: implement bajarCaso
  }

  @override
  Future<Caso> getCasoById(int casoId) {
    // TODO: implement getCasoById
    throw UnimplementedError();
  }

  @override
  Future<List<Caso>> todosLosCasos() async {
    QuerySnapshot snapshot = await coleccionCasos.get();
    return snapshot.docs
        .map((doc) => Caso.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Caso>> todosLosCasosPendientes() async {
    try {
      QuerySnapshot query =
          await coleccionCasos.where("estado", isEqualTo: "pendiente").get();
      if (query.docs.isNotEmpty) {
        return query.docs
            .map((doc) => Caso.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("Caso no encontrado");
      }
    } catch (e) {
      print("Error al buscar casos pendientes!");
      throw Exception("Error al buscar caso");
    }
  }
}
