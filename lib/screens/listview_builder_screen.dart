import 'dart:developer';

import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder Screen'),
      ),
      body: Center(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            log('posicion $index');
            return ListTile(
                leading: const Icon(Icons.check_box),
                title: Text('Elemento nro $index'),
                subtitle: const Text('Subtitulo de la lista'),
                trailing: const Icon(Icons.people));
          },
        ),
      ),
    );
  }
}
