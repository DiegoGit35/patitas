import 'package:flutter/material.dart';
import 'package:patitas/screens/routes/routes.dart';
import 'package:patitas/screens/widgets/botones.dart';
import 'package:patitas/screens/widgets/colores.dart';
import 'package:patitas/screens/widgets/imagenes.dart';

class Pageadopcion extends StatelessWidget {
  const Pageadopcion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("menu", context);
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
            Container(
              height: 460,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(10), child: animalItem());
                },
              ),
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

Container animalItem() {
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
              animeFoto(),
              SizedBox(height: 20),
              SizedBox(
                child: Column(
                  children: [
                    texto("ubicacion:", 15, Colors.black, true),
                    texto("El 742 de Evergreen Terrace PEDILOOOOOOOOOOOOO", 15,
                        const Color.fromARGB(255, 75, 75, 75), false),
                    texto("contacto:", 15, Colors.black, true),
                    texto("26746781263", 15,
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

Container animeFoto() {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 153, 111, 111),
        borderRadius: BorderRadius.circular(100)),
    height: 200,
    width: 200,
    clipBehavior: Clip.antiAlias,
    child: Center(
      child: Image.asset(
        dogoSample,
        height: 500,
        fit: BoxFit.cover,
      ),
    ),
  );
}
