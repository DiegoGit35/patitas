import 'package:flutter/material.dart';
import 'package:patitas/domain/entities/caso.dart';

class Pagecaso extends StatelessWidget {
  Pagecaso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            fotoAnimal("foto"),
          ],
        ),
      ),
    );
  }
}

Widget datosCaso() {
  return Column(
    children: [],
  );
}

// Widget MyTextCaso(String info, String dato){
//   return SizedBox(
//     child: colum,
//   )
// }

Widget fotoAnimal(String foto) {
  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 3),
      borderRadius: BorderRadius.circular(100),
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
