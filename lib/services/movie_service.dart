import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieService {
  final String _apiKey = '3b2c7d0a1ee0207ba064e2dbfcbb97aa';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<dynamic>> fetchPopularMovies() async {
    final url = Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=es-MX&page=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Error al obtener películas populares');
    }
  }
}