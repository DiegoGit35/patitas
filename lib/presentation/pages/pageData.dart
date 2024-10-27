import 'package:flutter/material.dart';

import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/entities/usuario.dart';

import '../../domain/use_cases/administracion_patitas.dart';

class Pagedata extends StatelessWidget {
  const Pagedata({super.key});
  @override
  Widget build(BuildContext context) {
    AdministracionPatitas adm = AdministracionPatitas();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("inicio");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("data"),
      ),
      // body: ListView.separated(
      //   itemCount: adm.getTodosLosUsuariosActivos(),
      //   separatorBuilder: (BuildContext context, int index) => const Divider(),
      //   itemBuilder: (BuildContext context, int index) {
      //     Usuario unUsuario = adaptador.listaUsuario[index];
      //     return Center(
      //       child: Text(
      //           "nombre:  ${unUsuario.nombre}\napellido:  ${unUsuario.apellido}\ntelefono o email:  ${unUsuario.email}\npassword:  ${unUsuario.contrasenia}\nfecha de nacimiento:  ${unUsuario.fechaNacimiento}\ngenero:  ${unUsuario.sexo}"),
      //     );
      //   },
      // ),
      body: FutureBuilder<List<Usuario>>(
        future: adm.getTodosLosUsuariosActivos(),
        builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay usuarios activos.'));
          } else {
            List<Usuario> usuarios = snapshot.data!;
            return ListView.separated(
              itemCount: usuarios.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                Usuario unUsuario = usuarios[index];
                return Center(
                  child: Text(
                    "Nombre: ${unUsuario.nombre}\n"
                    "Apellido: ${unUsuario.apellido}\n"
                    "Teléfono o email: ${unUsuario.email}\n"
                    "Password: ${unUsuario.contrasenia}\n"
                    "Fecha de nacimiento: ${unUsuario.fechaNacimiento}\n"
                    "Género: ${unUsuario.sexo}\n"
                    "Tipo: ${unUsuario.tipo}",
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
