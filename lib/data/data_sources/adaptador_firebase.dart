import '../../domain/use_cases/administracion_patitas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// AdaptadorRepositorio adaptador = AdaptadorRepositorio();

// AdministracionPatitas adminApp = AdministracionPatitas();

CollectionReference coleccionCasos =
    FirebaseFirestore.instance.collection("Casos");

CollectionReference coleccionUser =
    FirebaseFirestore.instance.collection("Usuarios");
