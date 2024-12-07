import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';

// ignore: must_be_immutable
class PageAnuser extends StatefulWidget {
  Usuario usuario;
  PageAnuser({super.key, required this.usuario});

  @override
  State<PageAnuser> createState() => _PageAnuserState();
}

class _PageAnuserState extends State<PageAnuser> {
  bool userState = false;
  bool procesando = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userState = widget.usuario.fechaDeBaja != null ? false : true;
    print("id del usuario: ${widget.usuario.idUsuario}");
  }

  @override
  Widget build(BuildContext context) {
    void funcionBoton() {
      if (userState) {
        setState(() {
          procesando = true;
          adminApp.desactivarUnUsuario(widget.usuario);
          userState = userState ? false : true;
          procesando = false;
        });
      } else {
        setState(() {
          procesando = true;
          adminApp.activarUnUsuario(widget.usuario);
          userState = userState ? false : true;
          procesando = false;
        });
      }

      // si el usuario está activado
      // setState(() {
      //   if (userState) {
      //
      //   }
      //   // else {
      //   // //   //si el usuario esta desactivado
      //   // //   // adminApp.activarUnUsuario(widget.usuario);
      //   // // }
      // });

      // setState(() {
      //   if (userState) {
      //     userState = false;
      //   } else {
      //     userState = true;
      //   }
      // });
      //
    }

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => cambiarPantalla("adminsUser"),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          texto("ESTADO: ", 20, Colors.black, true),
          const SizedBox(width: 10),
          texto(userState ? "ACTIVADO" : "DESACTIVADO", 20,
              userState ? Colors.green : Colors.red, true),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "https://icons-for-free.com/iff/png/512/person+profile+user+icon-1320184051308863170.png",
                width: 200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texto("NOMBRE Y APELLIDO", 15, Colors.black, false),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: texto(
                      "${widget.usuario.nombre!} ${widget.usuario.apellido!}",
                      20,
                      Colors.black,
                      true),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texto("TIPO DE USUARIO", 15, Colors.black, false),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: texto(
                      widget.usuario.tipo == TipoDeUsuario.normal
                          ? "Normal"
                          : "Administrador",
                      20,
                      Colors.black,
                      true),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texto("SEXO", 15, Colors.black, false),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: texto(widget.usuario.sexo!, 20, Colors.black, true),
                )
              ],
            ),
            const SizedBox(height: 20),
            _botonDesactivar(
              procesando: procesando,
              tittleNormal:
                  userState ? "DESACTIVAR USUARIO" : "ACTIVAR USUARIO",
              tittleProcesing:
                  userState ? "DESACTIVANDO... " : "ACTIVANDO USUARIO",
              funcion: () => funcionBoton(),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class _botonDesactivar extends StatelessWidget {
  bool procesando;
  String tittleNormal;
  String tittleProcesing;
  VoidCallback funcion;
  _botonDesactivar(
      {required this.procesando,
      required this.tittleNormal,
      required this.tittleProcesing,
      required this.funcion});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ElevatedButton(
        onPressed: () {
          if (!procesando) {
            // print(procesando);
            funcion();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (procesando) ...[
              texto(tittleProcesing, 15, Colors.black, true),
              const SizedBox(width: 10),
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            ],
            if (!procesando) ...[
              texto(tittleNormal, 15, Colors.black, true),
            ]
          ],
        ),
      ),
    );
  }
}
