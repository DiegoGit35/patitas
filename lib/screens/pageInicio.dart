import 'package:flutter/material.dart';
import 'package:patitas/screens/routes/routes.dart';
import 'package:patitas/screens/widgets/botones.dart';
import 'package:patitas/screens/widgets/colores.dart';

class Pageinicio extends StatelessWidget {
  const Pageinicio({super.key});

// windows GOD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            containerOne(context),
            containerTwo(context),
          ],
        ),
      ),
    );
  }
}

Container containerOne(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/imagenes/logo.png", width: 220),
          SizedBox(
            child: Column(
              children: [
                boton("registrar usuario", () {
                  cambiarPantalla("registrarse", context);
                }),
                const SizedBox(height: 10),
                boton("iniciar sesión", () {})
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Container containerTwo(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          info(),
          SizedBox(
            child: Column(
              children: [
                boton("se busca", () {}),
                const SizedBox(height: 10),
                boton("adopcion", () {}),
                const SizedBox(height: 10),
                boton("transito", () {})
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
            color: infoFondoColor, borderRadius: BorderRadius.circular(5)),
        width: 500,
        child: const Column(
          children: [
            Text(
              "Patitas Callejeras se formó el 9 de marzo de 2023 en respuesta al maltrato y abandono de animales en las calles, así como a la tenencia irresponsable de mascotas. Durante nuestro primer año, realizamos campañas de adopción, esterilización y concientización sobre tenencia responsable, además de recibir donaciones. El objetivo de Patitas Callejeras Valle de Uco es sensibilizar y fomentar el respeto hacia los animales y la vida en general, buscando erradicar la crueldad hacia los animales.",
              style: TextStyle(
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
