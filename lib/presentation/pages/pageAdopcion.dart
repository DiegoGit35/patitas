import 'package:flutter/material.dart';

import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/presentation/widgets/colores.dart';

import '../../domain/use_cases/administracion_patitas.dart';

class Pageadopcion extends StatelessWidget {
  const Pageadopcion({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Mostrar un mensaje de error en caso de fallo
                  return Text("Error: ${snapshot.error}");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // Mostrar un mensaje en caso de que no haya datos disponibles
                  return Text("No hay casos disponibles para adopción.");
                } else {
                  // Si hay datos, construir el ListView
                  List<Caso> casos = snapshot.data!;
                  return Container(
                    height: 460,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: casos.length,
                      itemBuilder: (BuildContext context, int index) {
                        Caso unAnimal = casos[index];
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: animalItem(unAnimal),
                          ),
                        );
                      },
                    ),
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

Container animalItem(Caso unAnimal) {
  return Container(
    width: 300,
    height: 400,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 250,
        height: 500,
        child: Center(
          child: Column(
            children: [
              animalFoto(unAnimal.foto),
              SizedBox(height: 20),
              SizedBox(
                child: Column(
                  children: [
                    texto("ubicacion:", 15, Colors.black, true),
                    texto(unAnimal.direccion, 15,
                        const Color.fromARGB(255, 75, 75, 75), false),
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
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(100)),
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
