import 'package:flutter/material.dart';

class DemoProviderScreen extends StatelessWidget {
  const DemoProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Provider Demo'),
        elevation: 10,
        toolbarHeight: 80,
      ),
      bottomNavigationBar: const ControlNavigation(),
      body: const ElementsBody(),
    );
  }
}

class ControlNavigation extends StatefulWidget {
  const ControlNavigation({super.key});

  @override
  State<ControlNavigation> createState() => _ControlNavigationState();
}

class _ControlNavigationState extends State<ControlNavigation> {
  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    /* final page = Provider.of<_handlerPage>(context, listen: true); */

    return BottomNavigationBar(
        currentIndex: _paginaActual,
        elevation: 10,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            print('value: $value');
            _paginaActual = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR',
            activeIcon: Icon(Icons.qr_code_2_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Q2',
            activeIcon: Icon(Icons.qr_code_2_outlined),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Q3',
              activeIcon: Icon(Icons.qr_code_2_outlined),
              tooltip: 'Boton 3'),
        ]);
  }
}

class ElementsBody extends StatelessWidget {
  const ElementsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Text Body'),
    );
  }
}
