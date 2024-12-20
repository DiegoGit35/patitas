import 'package:flutter/material.dart';

import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/presentation/pages/pageCaso.dart';
import 'package:patitas/presentation/widgets/colores.dart';

import '../../domain/use_cases/administracion_patitas.dart';

class PageAdopcion extends StatelessWidget {
  const PageAdopcion({super.key});

  @override
  Widget build(BuildContext context) {
    AdministracionPatitas adminApp = AdministracionPatitas();
    Future<List<Caso>> listaAdoptables =
        adminApp.getCasosDeAdopcionNoResueltos();

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("menu");
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            texto("quiero y necesito una familia", 40, Colors.black, true),
            texto(
                "Buscamos familias responsables que nos cuiden, nos den amor y un techito para resguardarnos.💖",
                25,
                Colors.black,
                false),
            FutureBuilder<List<Caso>>(
              future: listaAdoptables,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Caso>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Mostrar un indicador de carga mientras se espera la respuesta
                  return const Align(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Mostrar un mensaje de error en caso de fallo
                  return Text("Error: ${snapshot.error}");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // Mostrar un mensaje en caso de que no haya datos disponibles
                  return const Text("No hay casos disponibles para adopción.");
                } else {
                  // Si hay datos, construir el ListView
                  List<Caso> casos = snapshot.data!;
                  return Container(
                    width: MediaQuery.of(context).size.width,

                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8, crossAxisCount: 4),
                      itemCount: casos.length,
                      itemBuilder: (BuildContext context, int index) {
                        Caso unAnimal = casos[index];

                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: animalItem(unAnimal, context),
                          ),
                        );
                      },
                    ),
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: casos.length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     Caso unAnimal = casos[index];
                    //     return Center(
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(5),
                    //         child: animalItem(unAnimal, context),
                    //       ),
                    //     );
                    //   },
                    // ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Text texto(String texto, double size, Color color, bool masGrueso) {
  return Text(
    texto.toUpperCase(),
    style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: masGrueso ? FontWeight.bold : FontWeight.normal),
    textAlign: TextAlign.center,
  );
}

Container animalItem(Caso unAnimal, context) {
  return Container(
    width: 300,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagecaso(unCaso: unAnimal)));
      },
      style: ElevatedButton.styleFrom(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              animalFoto(unAnimal.foto),
              SizedBox(
                child: Column(
                  children: [
                    texto("ubicacion:", 15, Colors.black, true),
                    texto(unAnimal.direccion, 15,
                        const Color.fromARGB(255, 75, 75, 75), false),
                    const SizedBox(height: 10),
                    texto("contacto:", 15, Colors.black, true),
                    texto(unAnimal.contacto, 15,
                        const Color.fromARGB(255, 75, 75, 75), false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Container animalFoto(String foto) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    height: 200,
    width: 200,
    clipBehavior: Clip.antiAlias,
    child: Center(
      child: Image.asset(
        foto,
        height: 500,
        fit: BoxFit.cover,
      ),
    ),
  );
}
