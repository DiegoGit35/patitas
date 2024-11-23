import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/widgets/colores.dart';

class PageBusqueda extends StatelessWidget {
  const PageBusqueda({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Caso>> listaEnBusqueda = adminApp.getTodosLosAnimalesPerdidos();
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => cambiarPantalla("menu"),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            texto("ANIMALES PERDIDOS", 40, Colors.black, true),
            FutureBuilder<List<Caso>>(
              future: listaEnBusqueda,
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
