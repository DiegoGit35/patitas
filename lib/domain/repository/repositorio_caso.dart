import '../../data/models/caso_model.dart';
import '../entities/caso.dart';

abstract class RepositorioCaso {
  Future<List<CasoModel>> todosLosCasos();

  Future<List<CasoModel>> todosLosCasosPendientes();

  // Future<List<Caso>> todosLosCasosResueltos();

  Future<CasoModel?> getCasoPorId(int id);

  void agregarCaso(Caso nuevoCaso);

  void bajarCaso(int id);
}
