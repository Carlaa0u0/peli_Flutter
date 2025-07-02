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
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    await fetchPopularMovies();
    await fetchPopularSeries();
    await fetchLatestReleases();
  }

  Future<void> fetchPopularMovies() async {
    try {
      _popularMovies = await MovieService.getPopularMovies();
      notifyListeners();
    } catch (e) {
      print('Error al cargar películas populares: $e');
    }
  }

  Future<void> fetchPopularSeries() async {
    try {
      _popularSeries = await MovieService.getPopularSeries();
      notifyListeners();
    } catch (e) {
      print('Error al cargar series populares: $e');
    }
  }

  Future<void> fetchLatestReleases() async {
    try {
      _latestReleases = await MovieService.getLatestReleases();
      notifyListeners();
    } catch (e) {
      print('Error al cargar últimos estrenos: $e');
    }
  }
}
