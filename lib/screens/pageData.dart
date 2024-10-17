import 'package:flutter/material.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/entidades/usuario.dart';
import 'package:patitas/screens/routes/routes.dart';

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
                "nombre:  ${unUsuario.nombre}\napellido:  ${unUsuario.apellido}\ntelefono o email:  ${unUsuario.telefonoOEmail}\npassword:  ${unUsuario.password}\nfecha de nacimiento:  ${unUsuario.fechaNacimiento}\ngenero:  ${unUsuario.genero}"),
          );
        },
      ),
    );
  }
}
