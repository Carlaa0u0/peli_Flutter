import 'package:flutter_pelicula_1/models/movie.dart';
// import 'package:http/http.dart' as http; // Descomentar cuando se use la API real
// import 'dart:convert'; // Descomentar cuando se use la API real

class MovieService {
  // const String _apiKey = 'TU_API_KEY_AQUI'; // Reemplaza con tu clave de API de TMDB
  // const String _baseUrl = 'https://api.themoviedb.org/3';

  // Future<List<Movie>> fetchPopularMovies() async {
  //   final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=es-ES'));
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = json.decode(response.body);
  //     final List<dynamic> results = data['results'];
  //     return results.map((json) => Movie.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load popular movies');
  //   }
  // }

  // Método para obtener películas populares (cascarón)
  static List<Movie> getPopularMovies() {
    // Aquí se implementaría la lógica para llamar a la API y devolver las películas
    return []; // Retorna una lista vacía por ahora
  }

  // Método para obtener series populares (cascarón)
  static List<Movie> getPopularSeries() {
    // Aquí se implementaría la lógica para llamar a la API y devolver las series
    return []; // Retorna una lista vacía por ahora
  }

  // Método para obtener los últimos estrenos (cascarón)
  static List<Movie> getLatestReleases() {
    // Aquí se implementaría la lógica para llamar a la API y devolver los últimos estrenos
    return []; // Retorna una lista vacía por ahora
  }
}