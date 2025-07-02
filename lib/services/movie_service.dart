import 'package:flutter_pelicula_1/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieService {
  static final String _apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  // Películas populares
  static Future<List<Movie>> getPopularMovies() async {
    final url = '$_baseUrl/movie/popular?api_key=$_apiKey&language=es-ES';
    return _fetchMoviesFromUrl(url);
  }

  // Series populares
  static Future<List<Movie>> getPopularSeries() async {
    final url = '$_baseUrl/tv/popular?api_key=$_apiKey&language=es-ES';
    return _fetchMoviesFromUrl(url);
  }

  // Últimos estrenos
  static Future<List<Movie>> getLatestReleases() async {
    final url = '$_baseUrl/movie/now_playing?api_key=$_apiKey&language=es-ES';
    return _fetchMoviesFromUrl(url);
  }

  // Función genérica para obtener películas desde una URL
  static Future<List<Movie>> _fetchMoviesFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar datos de TMDb');
    }
  }
// Buscar películas y series por texto
static Future<List<Movie>> searchMoviesAndSeries(String query) async {
  final movieUrl = '$_baseUrl/search/movie?api_key=$_apiKey&language=es-ES&query=$query';
  final seriesUrl = '$_baseUrl/search/tv?api_key=$_apiKey&language=es-ES&query=$query';

  final movieResponse = await http.get(Uri.parse(movieUrl));
  final seriesResponse = await http.get(Uri.parse(seriesUrl));

  List<Movie> results = [];

  if (movieResponse.statusCode == 200) {
    final List<dynamic> movieResults = json.decode(movieResponse.body)['results'];
    results.addAll(movieResults.map((json) => Movie.fromJson(json)).toList());
  }

  if (seriesResponse.statusCode == 200) {
    final List<dynamic> seriesResults = json.decode(seriesResponse.body)['results'];
    results.addAll(seriesResults.map((json) => Movie.fromJson(json)).toList());
  }

  return results;
}




  
}
