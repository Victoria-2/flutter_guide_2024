import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_guide_2024/models/foto_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_guide_2024/models/lista_fotos_models.dart';

class FotosFuture {
  static Future<List<Photos>> getPhotos([int page = 1]) async {
    final url = Uri.https('api.unsplash.com', '/photos',
        {'client_id': dotenv.env['API_KEY_UNSPLASH'], 'page': '$page'});
    print(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('ok from mockapi');
      return photosFromJson(response.body);
    } else {
      throw Exception('Failed to load photos');
    }
  }

  /*  static Future<List<Peliculas>> getPeliculas() async {
    final url = Uri.https('api.unsplash.com', '/peliculas',
        {'client_id': dotenv.env['API_KEY_UNSPLASH'], 'page': '1'});
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      return peliculasFromJson(response.body);
    } else {
      throw Exception('Failed to load photos');
    }
  } */
}
