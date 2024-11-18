import '../entities/caso.dart';

abstract class RepositorioCaso {
  void agregarCaso(Caso nuevoCaso);
  void bajarCaso(int casoId);
  Future<List<Caso>> todosLosCasos();
  Future<List<Caso>> todosLosCasosPendientes();
  Future<Caso> getCasoById(int casoId);
  Future<String> obtenerIDDocumento(String idCaso);
  Future<List<Caso>> todosLosTransitosPendientes();
  Future<List<Caso>> todosLosAdopcionPendientes();
  void actualizarDatosCasos(
      String atributoName, dynamic newData, String idCasoDocument);
}
