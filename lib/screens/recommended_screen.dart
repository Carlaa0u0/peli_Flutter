import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pelicula_1/providers/movie_provider.dart';
import 'package:flutter_pelicula_1/widgets/auto_carousel.dart';
import 'package:flutter_pelicula_1/widgets/movie_carousel.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Carrusel automático de cards (ocupando el mayor espacio posible)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4, // Aproximadamente el 40% de la altura de la pantalla
            child: AutoCarousel(movies: movieProvider.popularMovies),
          ),
          const SizedBox(height: 20),
          // Secciones debajo del carrusel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Últimos Estrenos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.latestReleases),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Películas Populares',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          MovieCarousel(movies: movieProvider.popularMovies),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Series Destacadas',
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