import 'dart:ui';

import 'package:flutter_parcial2/json/menu_json.dart';
import 'package:flutter_parcial2/temas/colores.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int menuactivo = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: negro,
      appBar: barraApp(),
      body: bodyApp(),
    );
  }

  barraApp() {
    return AppBar(
      backgroundColor: negro,
      elevation: 10,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Tortas El Zarco",
            style: TextStyle(
                fontSize: 20, color: blanco, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.list_outlined)
        ]),
      ),
    );
  }

  bodyApp() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/fondo.jpg'),
        fit: BoxFit.fill,
      )),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          separador(20),
          logoApp(),
          separador(20),
          txtSearch(),
          separador(30),
          slideCombos(),
          separador(30),
          slideProductos(),
          separador(80),
        ]),
      ),
    );
  }

  separador(double number) {
    return SizedBox(
      height: number,
    );
  }

  Widget logoApp() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/Logo.jpg"),
        fit: BoxFit.fitHeight,
      )),
    );
  }

  Widget txtSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 2),
      child: const TextField(
        decoration: InputDecoration(
            hintText: "Buscar",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  slideCombos() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: List.generate(combos.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    menuactivo = index;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(combos[index]['img'])),
                          color: primario,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Text(
                      combos[index]['title'],
                      style: TextStyle(
                          fontSize: 15,
                          color: menuactivo == index ? primario : negro,
                          fontWeight: FontWeight.w600),
                    ),
                    menuactivo == index
                        ? Container(
                            width: 10,
                            height: 3,
                            decoration: BoxDecoration(
                                color: primario,
                                borderRadius: BorderRadius.circular(5)),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  slideProductos() {
    List lst = [];
    if (menuactivo == 0) lst = lsthamb;
    if (menuactivo == 1) lst = lstcarne;
    if (menuactivo == 2) lst = lstpizza;
    if (menuactivo == 3) lst = lstpollo;
    if (menuactivo == 4) lst = lsttacos;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: List.generate(lst.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Color.fromARGB(255, 255, 68, 208)),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: rosa.withOpacity(0.5), spreadRadius: 5, blurRadius: .5, offset: Offset(0,3))],
                    color: rosa),
                    
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(lst[index]['img'])),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/starts.png')),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Text(
                        lst[index]['title'],
                        style: TextStyle(
                            fontSize: 17,
                            color: negro,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        lst[index]['precio'],
                        style: TextStyle(
                            fontSize: 20,
                            color: negro,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
