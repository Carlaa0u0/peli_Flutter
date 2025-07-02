import 'package:flutter/material.dart';
import 'package:flutter_pelicula_1/models/movie.dart';
import 'package:flutter_pelicula_1/widgets/movie_card.dart'; // Importa MovieCard

class MovieCarousel extends StatelessWidget {
  final List<Movie> movies;

  const MovieCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No hay contenido disponible en esta sección.'),
      );
    }
    return SizedBox(
      height: 280, // Altura fija para el carrusel de cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCard(movie: movie); // MovieCard ahora maneja su propia navegación
        },
      ),
    );
  }
}
