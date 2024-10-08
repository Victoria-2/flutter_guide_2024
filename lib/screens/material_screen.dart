import 'package:flutter/material.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libreria Material'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Texto con estilo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Texto expandido',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Icon(Icons.add),
                  Icon(Icons.people),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Container + Row',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CreateBox(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                  margin: 10,
                  padding: 10,
                  icon: Icons.place,
                ),
                CreateBox(
                  width: 50,
                  height: 50,
                  margin: 10,
                  padding: 10,
                  texto: 'data',
                ),
                CreateBox(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                  margin: 10,
                  padding: 10,
                  icon: Icons.place,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Expanded vertical',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: CreateBox(
              height: 0,
              width: 3,
            )),
          ],
        ),
      ),
    );
  }
}

class CreateBox extends StatelessWidget {
  double height;
  double width;

  double? margin;
  double? padding;

  Color? color;
  IconData? icon;
  String? texto = '';

  CreateBox({
    super.key,
    required this.width,
    required this.height,
    this.margin = 0,
    this.padding = 0,
    this.color,
    this.icon,
    this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin ?? 0.0),
      padding: EdgeInsets.all(padding ?? 0.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 1),
      ),
      width: width,
      alignment: Alignment.center,
      height: height,
      child: icon != null ? Icon(icon) : Text(texto ?? ''),
    );
  }
}
