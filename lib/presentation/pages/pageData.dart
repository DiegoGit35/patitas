import 'package:flutter/material.dart';
import 'package:patitas/data/adaptador.dart';

import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/entities/usuario.dart';

class Pagedata extends StatelessWidget {
  const Pagedata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("inicio");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("data"),
      ),
      body: ListView.separated(
        itemCount: adaptador.listaUsuario.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          Usuario unUsuario = adaptador.listaUsuario[index];
          return Center(
            child: Text(
                "nombre:  ${unUsuario.nombre}\napellido:  ${unUsuario.apellido}\ntelefono o email:  ${unUsuario.email}\npassword:  ${unUsuario.contrasenia}\nfecha de nacimiento:  ${unUsuario.fechaNacimiento}\ngenero:  ${unUsuario.sexo}"),
          );
        },
      ),
    );
  }
}
