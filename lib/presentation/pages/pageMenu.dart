import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';
import 'package:patitas/presentation/widgets/boton_menu.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        title: const Text("MENU"),
      ),
      body: Center(
        child: FutureBuilder<Container>(
          future: containerTwo(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Ocurrió un error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              return const Text("No hay datos disponibles");
            }
          },
        ),
      ),
    );
  }
}

Future<Container> containerTwo(context) async {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          info(context),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Align(
              child: FutureBuilder<TipoDeUsuario>(
                future: session.getTipoDeUsuario(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator());
                  }

                  TipoDeUsuario tipoUsuario = snapshot.data!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      BotonMenu(
                          tittle: "se busca",
                          icon: Icons.search,
                          funcion: () {}),
                      const SizedBox(height: 10),
                      BotonMenu(
                        tittle: "en adopcion",
                        icon: Icons.pets,
                        funcion: () => cambiarPantalla("adopcion"),
                      ),
                      const SizedBox(width: 10),
                      const SizedBox(height: 10),
                      BotonMenu(
                        tittle: "transitar",
                        icon: Icons.date_range,
                        funcion: () => cambiarPantalla("transitar"),
                      ),
                      const SizedBox(height: 10),
                      if (tipoUsuario == TipoDeUsuario.administrador) ...[
                        BotonMenu(
                          tittle: "registrar un animal",
                          icon: Icons.add,
                          funcion: () => cambiarPantalla("registrarAnimal"),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(width: 10),
                        BotonMenu(
                          tittle: "administrar usuario",
                          icon: Icons.person,
                          funcion: () {},
                        ),
                      ],
                      const SizedBox(height: 15),
                      BotonMenu(
                        tittle: "cerrar sesion",
                        icon: Icons.logout,
                        funcion: () => cambiarPantalla("inicio"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget info(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2,
    height: MediaQuery.of(context).size.height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿QUIENES SOMOS?",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "infoFont",
                fontSize: 30)),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(5)),
          width: 500,
          child: const Column(
            children: [
              Text(
                "Patitas Callejeras se formó el 9 de marzo de 2023 en respuesta al maltrato y abandono de animales en las calles, así como a la tenencia irresponsable de mascotas. Durante nuestro primer año, realizamos campañas de adopción, esterilización y concientización sobre tenencia responsable, además de recibir donaciones. El objetivo de Patitas Callejeras Valle de Uco es sensibilizar y fomentar el respeto hacia los animales y la vida en general, buscando erradicar la crueldad hacia los animales.",
                style: TextStyle(
                  fontFamily: "nunito",
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
