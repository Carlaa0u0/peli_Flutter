import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_pelicula_1/models/movie.dart';
import 'package:flutter_pelicula_1/screens/detail_screen.dart'; // Importa la pantalla de detalles

class MovieCard extends StatelessWidget {
  final Movie movie;
  // No necesitamos onTap aquí si siempre navegamos a DetailScreen
  // final VoidCallback onTap;

  const MovieCard({super.key, required this.movie}); // Eliminamos onTap del constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la pantalla de detalles al tocar la tarjeta
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(movie: movie),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}', // <-- CORRECCIÓN AQUÍ
                placeholder: (context, url) => Container(
                  height: 200,
                  color: Colors.grey[800],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 200,
                  color: Colors.grey[800],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.white54),
                ),
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}