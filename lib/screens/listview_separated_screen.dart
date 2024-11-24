import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/helpers/people_future.dart';
import 'package:flutter_guide_2024/models/people_model.dart';
import 'package:flutter_guide_2024/searchs/search_people.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  const ListViewSeparatedScreen({super.key});

  @override
  State<ListViewSeparatedScreen> createState() =>
      _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  late Future<List<People>?> listaPersonas;
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    listaPersonas = futurePeopleList(page);
    isLoading = false;
    page++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: SearchPeopleDelegate()),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<People>?>(
          future: listaPersonas,
          builder: (context, AsyncSnapshot<List<People>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final people = snapshot.data![index];
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'people_screen',
                          arguments: <String, dynamic>{'id': people.id});
                    },
                    onLongPress: () {
                      print('Long press.....');
                    },
                    leading:
                        Text(people.id, style: const TextStyle(fontSize: 15)),
                    title: Text(
                      '${people.firstname} ${people.lastname}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(people.email),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
