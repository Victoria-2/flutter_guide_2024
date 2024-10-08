import 'dart:developer';

import 'package:flutter/material.dart';

class CustomListScreen extends StatelessWidget {
  final List _elements = [
    ['avatar1', 'Juan Pablo Segundo', 'Ingeniero', 42, true],
    ['avatar2', 'Pedro Perez', 'Arquitecto', 23, true],
    ['avatar3', 'Mariano Moreno', 'Director', 44, true],
    ['avatar4', 'Cristian Diaz', 'Limpieza', 2, false],
    ['avatar5', 'Max Power', 'Técnico', 2, false],
    ['avatar6', 'Emilio Gonzalez', 'Operador', 1, false],
    ['avatar7', 'Ana Valente', 'Soldador', 4, false],
    ['avatar8', 'Maria Sanz', 'Sistemas', 4, false],
    ['avatar9', 'Sebastian Gañan', 'Sistemas', 52, false],
    ['avatar10', 'Nando Fernandez', 'Operador', 6, false],
    ['avatar11', 'Carla Massei', 'Jefe', 7, false],
    ['avatar12', 'Lara Tomasso', 'Jefe', 21, false],
    ['avatar13', 'Carlos Schwindt', 'Limpieza', 9, false],
  ];

  CustomListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _elements.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              log('onTap $index');
            },
            onLongPress: () {
              log('onLongPress $index');
            },
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(31, 22, 78, 189),
                        blurRadius: 15,
                        spreadRadius: 5,
                        offset: Offset(0, 6))
                  ]),
              child: Row(
                children: [
                  Image.asset('assets/avatars/${_elements[index][0]}.png',
                      width: 50, height: 50),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _elements[index][1],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(_elements[index][2]),
                      ],
                    ),
                  ),
                  Icon(_elements[index][4]
                      ? Icons.star_border_outlined
                      : Icons.star),
                  Text(_elements[index][3].toString())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
