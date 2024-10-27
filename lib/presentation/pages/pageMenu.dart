import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';
import 'package:patitas/domain/use_cases/user_manager.dart';
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
<<<<<<< HEAD
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                boton("se busca", () {}),
                const SizedBox(height: 10),
                boton("adopcion", () {
                  cambiarPantalla("adopcion");
                }),
                const SizedBox(height: 10),
                boton("transito", () {
                  cambiarPantalla("transitar");
                }),
                const SizedBox(height: 10),
                boton("agregar animalito", () {
                  cambiarPantalla("registrarAnimal");
                }),
                const SizedBox(height: 15),
                boton("cerrar session", () {
                  cambiarPantalla("inicio");
                }),
              ],
=======
            child: FutureBuilder<TipoDeUsuario>(
              future: session.getTipoDeUsuario(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                TipoDeUsuario tipoUsuario = snapshot.data!;

                return Column(
                  children: [
                    const SizedBox(height: 10),
                    boton("se busca", () {}),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: boton("adopcion", () {
                            cambiarPantalla("adopcion");
                          }),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: boton("transito", () {
                            cambiarPantalla("transitar");
                          }),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (tipoUsuario == TipoDeUsuario.administrador) ...[
                      Row(
                        children: [
                          Expanded(
                            child: boton("Administrar Casos", () {
                              cambiarPantalla("adopcion");
                            }),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: boton("Adminsitrar Usuarios", () {
                              cambiarPantalla("transitar");
                            }),
                          )
                        ],
                      ),
                    ],
                    const SizedBox(height: 15),
                    boton("cerrar session", () {
                      cambiarPantalla("inicio");
                    }),
                  ],
                );
              },
>>>>>>> 9c115f433076bbd88ba871fa8f5c598225adb0b7
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
