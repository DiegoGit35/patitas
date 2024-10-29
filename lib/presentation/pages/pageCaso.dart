import 'package:flutter/material.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';

class Pagecaso extends StatelessWidget {
  const Pagecaso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _fotoAnimal("foto"),
                  const SizedBox(height: 10),
                  _textDatos("registrado por", "AgustinZapata"),
                  const SizedBox(height: 10),
                  _textDatos("hace", "2 semanas"),
                  const SizedBox(height: 10),
                  boton("adoptar", () {})
                ],
              ),
            ),
            const SizedBox(width: 20),
            _containerDatos()
          ],
        ),
      ),
    );
  }
}

Widget _textDatos(String info, String data) {
  return Column(
    children: [
      Text(info.toUpperCase()),
      Text(
        data.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _containerDatos() {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          _textDatosTwo("Distrito", "La Consulta"),
          _textDatosTwo("Direccion", "Avenidad siempre viva 747"),
          _textDatosTwo("contacto", "2641238378"),
        ],
      ),
    ),
  );
}

Widget _textDatosTwo(String info, String data) {
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    width: 500,
    child: Column(
      children: [
        Text(info.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          data.toUpperCase(),
        ),
      ],
    ),
  );
}

Widget _fotoAnimal(String foto) {
  return Container(
    width: 300,
    height: 300,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 3),
      shape: BoxShape.circle,
      color: const Color.fromARGB(255, 117, 33, 27),
    ),
    child: Center(
      child: Text(
        foto,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
