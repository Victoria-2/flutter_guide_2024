import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_guide_2024/models/company_model.dart';
import 'package:flutter_guide_2024/models/list_companies.dart';
import 'package:flutter_guide_2024/models/list_people_model.dart';
import 'package:flutter_guide_2024/models/people_model.dart';
import 'package:http/http.dart' as http;

class PeopleProvider extends ChangeNotifier {
  List<People> listPeople = [];
  List<Company> listCompanies = [];
  int currentPage = 1;
  bool isLoading = false;

  PeopleProvider() {
    print('PeopleProvider......');
    this.getPeople();
    this.getCompanies();
  }

  getPeople([int limit = 10]) async {
    try {
      final url = Uri.https('66c78f59732bf1b79fa6e8c7.mockapi.io',
          '/api/v1/empleados', {'page': '$currentPage', 'limit': '$limit'});
      isLoading = true;
      final response = await http.get(url);
      if (response.statusCode == 200) {
        listPeople = [...listPeople, ...peopleFromJson(response.body)];
        print('Peticion realizada a MockAPI $currentPage');
        currentPage++;
      } else {
        print('Error en el servicio: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar el request: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  getCompanies([int page = 1, int limit = 10]) async {
    try {
      final url = Uri.https('66c78f59732bf1b79fa6e8c7.mockapi.io',
          '/api/v1/companies', {'page': '$page', 'limit': '$limit'});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        listCompanies = companyFromJson(response.body);
        print('Peticion realizada a MockAPI $currentPage');
      } else {
        print('Error en el servicio: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar el request: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<People?> getPeopleById(int id) async {
    try {
      final url = Uri.https(
          '66c78f59732bf1b79fa6e8c7.mockapi.io', '/api/v1/empleados/$id');
      print(url);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print('.....${People.fromJson(json.decode(response.body))}');
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
}
