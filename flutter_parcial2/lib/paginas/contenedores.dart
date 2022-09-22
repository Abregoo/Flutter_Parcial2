import 'package:flutter/material.dart';
//import "package:flutter_feather_icons/flutter_feather_icons.dart";
import '../temas/colores.dart';
import 'home.dart';

class Contenedores extends StatefulWidget {
  Contenedores({Key? key}) : super(key: key);

  @override
  State<Contenedores> createState() => _ContenedoresState();
}

class _ContenedoresState extends State<Contenedores> {
  int menu_activo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // bottomNavigationBar: zarcoFooter(),
      body: zarcoBody(),
    );
  }

  Widget zarcoBody() {
    return IndexedStack(index: menu_activo, children: [
      Home(),
    ]);
  }

}
