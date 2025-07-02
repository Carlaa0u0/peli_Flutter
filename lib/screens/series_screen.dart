import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pelicula_1/providers/movie_provider.dart';
import 'package:flutter_pelicula_1/widgets/movie_carousel.dart';


class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

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
              'Todas las Series',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.popularSeries),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Series de Drama', // Ejemplo de categoría
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.popularSeries.reversed.toList()), // Solo para mostrar diferentes datos
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Series de Ciencia Ficción', // Ejemplo de categoría
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.popularSeries),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}