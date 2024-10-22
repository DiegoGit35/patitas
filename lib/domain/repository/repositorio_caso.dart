import '../entities/caso.dart';

abstract class RepositorioCaso {
  void agregarCaso(Caso nuevoCaso);

  void bajarCaso(int id);
}
