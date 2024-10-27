import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/presentation/widgets/colores.dart';

class Pageregisteranimal extends StatelessWidget {
  const Pageregisteranimal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("menu");
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Row(
        children: [],
      ),
    );
  }
}
