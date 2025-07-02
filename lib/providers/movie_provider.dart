import 'package:flutter/material.dart';
import 'package:flutter_pelicula_1/models/movie.dart';
import 'package:flutter_pelicula_1/services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _popularMovies = [];
  List<Movie> _popularSeries = [];
  List<Movie> _latestReleases = [];

  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get popularSeries => _popularSeries;
  List<Movie> get latestReleases => _latestReleases;

  MovieProvider() {
    // Inicializa las listas vacías. Cuando se integre la API,
    // se llamarían los métodos de MovieService aquí.
    _popularMovies = MovieService.getPopularMovies();
    _popularSeries = MovieService.getPopularSeries();
    _latestReleases = MovieService.getLatestReleases();
    notifyListeners();
  }

  // En una aplicación real, aquí tendrías métodos para llamar a tu API
  // y actualizar las listas. Por ejemplo:
  /*
  Future<void> fetchPopularMovies() async {
    try {
      _popularMovies = await MovieService().fetchPopularMovies();
      notifyListeners();
    } catch (e) {
      print('Error fetching popular movies: $e');
      // Manejar el error, quizás mostrar un mensaje al usuario
    }
  }
  */
}