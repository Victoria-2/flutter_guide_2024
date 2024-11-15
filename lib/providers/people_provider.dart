import 'package:flutter/foundation.dart';
import 'package:flutter_guide_2024/models/company_model.dart';
import 'package:flutter_guide_2024/models/list_companies.dart';
import 'package:flutter_guide_2024/models/list_people_model.dart';
import 'package:flutter_guide_2024/models/people_model.dart';
import 'package:http/http.dart' as http;

class PeopleProvider extends ChangeNotifier {
  List<People> listPeople = [];
  List<Company> listCompanies = [];

  PeopleProvider() {
    print('PeopleProvider......');
    this.getPeople();
    this.getCompanies();
  }

  getPeople([int page = 1, int limit = 10]) async {
    try {
      print('realizando petición a MockAPI People......');
      final url = Uri.https('66c78f59732bf1b79fa6e8c7.mockapi.io',
          '/api/v1/empleados', {'page': '$page', 'limit': '$limit'});
      print(url);
      final response = await http.get(url);
      print('response ${response.statusCode}');
      if (response.statusCode == 200) {
        listPeople = peopleFromJson(response.body);
      } else {
        print('Error en el servicio: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar el request: $e');
    }
    notifyListeners();
  }

  getCompanies([int page = 1, int limit = 10]) async {
    try {
      print('realizando petición a MockAPI companies......');
      final url = Uri.https('66c78f59732bf1b79fa6e8c7.mockapi.io',
          '/api/v1/companies', {'page': '$page', 'limit': '$limit'});
      final response = await http.get(url);
      print('response ${response.statusCode}');
      if (response.statusCode == 200) {
        listCompanies = companyFromJson(response.body);
      } else {
        print('Error en el servicio: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar el request: $e');
    }
    notifyListeners();
  }
}
