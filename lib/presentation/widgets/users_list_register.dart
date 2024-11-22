import 'package:flutter/material.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/pages/page_anUser.dart';

class UsersListRegister extends StatefulWidget {
  const UsersListRegister({super.key});

  @override
  State<UsersListRegister> createState() => _UsersListRegisterState();
}

class _UsersListRegisterState extends State<UsersListRegister> {
  Future<List<Usuario>> listaUsuarios =
      adminApp.getTodosLosUsuariosRegistrados();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Usuario>>(
      future: listaUsuarios,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: snapshot.data.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return UserCard(usuario: snapshot.data[index]);
            },
          );
        } else {
          return const Flexible(
            flex: 1,
            child: SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

class UserCard extends StatelessWidget {
  Usuario usuario;
  UserCard({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageAnuser(usuario: usuario)));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "https://icons-for-free.com/iff/png/512/person+profile+user+icon-1320184051308863170.png",
                width: 100,
              ),
            ),
            texto(usuario.nombre!, 15, Colors.black, true),
            const SizedBox(width: 8),
            texto(usuario.apellido!, 15, Colors.black, true),
          ],
        ),
      ),
    );
  }
}
