import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('123'),
        ),
        leadingWidth: 40,
        toolbarHeight: 80,
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
                log('tap menu');
              },
            ),
          ),
        ],
      ),
      body: const Center(child: Text('Hola mundo')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.plus_one),
        onPressed: () {
          log('click button');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
