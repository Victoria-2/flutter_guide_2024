import 'dart:convert';
import 'package:flutter_guide_2024/models/list_people_model.dart';
import 'package:flutter_guide_2024/models/people_model.dart';
import 'package:http/http.dart' as http;

List<People> activeSearch = [];
String? lastQuery;

Future<People?> futurePeopleById(int id) async {
  try {
    final url = Uri.https(
        '66c78f59732bf1b79fa6e8c7.mockapi.io', '/api/v1/empleados/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return People.fromJson(json.decode(response.body));
    } else {
      print('Error en el servicio: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error al realizar el request: $e');
    return null;
  }
}

Future<List<People>?> futurePeopleList([int page = 1, int limit = 10]) async {
  final url = Uri.https('66c78f59732bf1b79fa6e8c7.mockapi.io',
      '/api/v1/empleados', {'page': '$page', 'limit': '$limit'});
  final response = await http.get(url);
  return peopleFromJson(response.body);
}

Future<List<People>?> searchPeople(query,
    [int page = 1, int limit = 10]) async {
  print('$query  $lastQuery');

  if (activeSearch != null && activeSearch.length > 0 && lastQuery == query) {
    print('abort search , return activeSearch');
    return activeSearch;
  }

  if (query == '' || query == null || query.toString().length < 3) {
    print('abort search $query');
    return null;
  }

  final url = Uri.https(
      '66c78f59732bf1b79fa6e8c7.mockapi.io',
      '/api/v1/empleados',
      {'page': '$page', 'limit': '$limit', 'filter': '$query'});
  final response = await http.get(url);
  print('searchPeople request');
  activeSearch = peopleFromJson(response.body);
  lastQuery = query;
  return activeSearch;
}

void clearActiveSearch() {
  activeSearch = [];
  lastQuery = '';
}
