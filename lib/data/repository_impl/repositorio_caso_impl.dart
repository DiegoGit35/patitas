import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patitas/domain/entities/caso.dart';
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
      "fechaRegistro": nuevoCaso.fechaRegistro,
      "fechaBaja": nuevoCaso.fechaBaja,
      "fechaResolucion": nuevoCaso.fechaResolucion,
      "tipoDeCaso": nuevoCaso.tipoDeCaso,
      "usuarioRegistrante": nuevoCaso.usuarioRegistrante,
      "estado": nuevoCaso.estado,
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
    return (await coleccionCasos.get())
        .docs
        .map((element) => element.data() as Map<String, dynamic>)
        .map((dict) => Caso(
              dict["idCaso"],
              dict["direccion"],
              dict["distrito"],
              dict["contacto"],
              dict["foto"],
              dict["fechaRegistro"],
              dict["fechaBaja"],
              dict["fechaResolucion"],
              dict["tipoDeCaso"],
              dict["usuarioRegistrante"],
              dict["estado"],
            ))
        .toList();
  }

  @override
  Future<List<Caso>> todosLosCasosPendientes() {
    // TODO: implement todosLosCasosPendientes
    throw UnimplementedError();
  }
}
