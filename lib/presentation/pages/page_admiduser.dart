import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/widgets/colores.dart';
import 'package:patitas/presentation/widgets/users_list_register.dart';

class PageAdmiduser extends StatelessWidget {
  const PageAdmiduser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => cambiarPantalla("menu"),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              texto("USUARIOS REGISTRADOS", 20, Colors.black, true),
              const Expanded(child: UsersListRegister())
            ],
          ),
        ),
      ),
    );
  }
}
