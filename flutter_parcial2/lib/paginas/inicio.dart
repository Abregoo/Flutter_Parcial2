import 'package:flutter/material.dart';
import 'package:flutter_parcial2/paginas/principal.dart';

class Parcial2 extends StatelessWidget {
  const Parcial2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
