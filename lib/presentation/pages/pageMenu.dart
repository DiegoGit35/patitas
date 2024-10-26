import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';

class Pagemenu extends StatelessWidget {
  const Pagemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        title: Text("MENU"),
      ),
      body: Center(
        child: containerTwo(context),
      ),
    );
  }
}

Container containerTwo(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          info(),
          SizedBox(
            child: Column(
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
                const SizedBox(height: 15),
                boton("cerrar session", () {
                  cambiarPantalla("inicio");
                }),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget info() {
  return Column(
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
  );
}
