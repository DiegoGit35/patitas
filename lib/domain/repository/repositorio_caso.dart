import '../entities/caso.dart';

abstract class RepositorioCaso {
  void agregarCaso(Caso nuevoCaso);
  void bajarCaso(int casoId);
  Future<List<Caso>> todosLosCasos();
  Future<List<Caso>> todosLosCasosPendientes();
  Future<Caso> getCasoById(int casoId);
  Future<String> obtenerIDDocumento(String idCaso);
  void actualizarDatosCasos(
      String atributoName, dynamic newData, String idCasoDocument);
}
