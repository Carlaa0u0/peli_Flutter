import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pelicula_1/providers/movie_provider.dart';
import 'package:flutter_pelicula_1/widgets/movie_carousel.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Todas las Películas',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.popularMovies),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Películas de Acción', // Ejemplo de categoría
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.popularMovies.reversed.toList()), // Solo para mostrar diferentes datos
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Películas de Comedia', // Ejemplo de categoría
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.popularMovies),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
