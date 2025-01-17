import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/helpers/people_future.dart';
import 'package:flutter_guide_2024/models/people_model.dart';

class SearchPeopleDelegate extends SearchDelegate {
  void reset() {
    query = '';
    clearActiveSearch();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => reset(), icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          reset();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    print('build results..............');
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder<List<People>?>(
      future: searchPeople(query),
      builder: (context, AsyncSnapshot<List<People>?> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final people = snapshot.data![index];
              return ListTile(
                onTap: () {
                  /* showResults(context); */
                  Navigator.pushNamed(context, 'people_screen',
                      arguments: <String, dynamic>{'id': people.id});
                },
                leading: Text(people.id, style: const TextStyle(fontSize: 15)),
                title: Text(
                  '${people.firstname} ${people.lastname}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(people.email),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 80,
            ),
          );
        } else {
          return const Center(
            child: Icon(
              Icons.find_in_page,
              size: 80,
            ),
          );
        }
      },
    );
  }
}
