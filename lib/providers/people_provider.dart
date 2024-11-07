import 'package:flutter/foundation.dart';
import 'package:flutter_guide_2024/models/list_people_model.dart';
import 'package:http/http.dart' as http;

class PeopleProvider extends ChangeNotifier {
  List listPeople = [];

  PeopleProvider() {
    print('PeopleProvider......');
    this.getPeople();
  }

  getPeople() async {
    try {
      print('realizando petición a MockAPI......');
      final url =
          Uri.https('66c78f59732bf1b79fa6e8c7.mockapi.io', '/api/v1/empleados');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        listPeople = peopleFromJson(response.body);
      } else {
        print('4xx 5xx');
      }
    } catch (e) {
      print('Error $e');
    }
    notifyListeners();
  }
}
