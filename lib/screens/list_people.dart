import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/providers/people_provider.dart';
import 'package:provider/provider.dart';

class ListPeopleScreen extends StatelessWidget {
  const ListPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listPersonas =
        Provider.of<PeopleProvider>(context, listen: true).listPeople;

    print('listPersonas..... $listPersonas');

    return Scaffold(
      appBar: AppBar(title: const Text('ListPeopleScreen')),
      body: ListView.builder(
        itemCount: listPersonas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${listPersonas[index].firstname} ${listPersonas[index].lastname}'),
            subtitle: Text(listPersonas[index].email),
          );
        },
      ),
    );
  }
}
