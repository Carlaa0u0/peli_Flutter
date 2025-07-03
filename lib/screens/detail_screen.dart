import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_pelicula_1/models/movie.dart';
import 'package:flutter_pelicula_1/widgets/custom_header.dart';
import 'package:flutter_pelicula_1/services/movie_service.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        onSearch: (query) async {
            if (query.isEmpty) return;

            final results = await MovieService.searchMoviesAndSeries(query);

            //if (!mounted) return; // Por si el widget ya fue desmontado

            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                shadowColor: Color(0xFFD43162),
                backgroundColor: Colors.grey[800],
                title: Text('Resultados para "$query"'),
                titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                content: SizedBox(
                  width: double.maxFinite,
                  height: 300,
                  child: results.isEmpty
                      ? const Text('No se encontraron resultados.')
                      : ListView.separated(
                          itemCount: results.length,
                          itemBuilder: (_, i) => ListTile(
                            title: Text(results[i].title),
                            textColor: Colors.white,
                            onTap: () {
                              Navigator.of(context).pop(); // Cierra el diálogo
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetailScreen(movie: results[i]),
                                ),
                              );
                            },
                            hoverColor: const Color(0xFFD43162),
                          ), separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey)
                        ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cerrar'),
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                  )
                ],
              ),
            );
          },

        /*title: Text(movie.title),
        titleTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),*/
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de fondo (backdrop)
            movie.backdropPath != null && movie.backdropPath!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                    placeholder: (context, url) => Container(
                      height: 250,
                      color: Colors.grey[800],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 250,
                      color: Colors.grey[800],
                      child: const Icon(Icons.broken_image, size: 50, color: Colors.white54),
                    ),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 250,
                    color: Colors.grey[800],
                    child: const Center(
                      child: Text(
                        'No hay imagen de fondo disponible',
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.voteAverage.toStringAsFixed(1)} / 10',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.calendar_today, color: Colors.white70, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        movie.releaseDate,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sinopsis:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  // Aquí iría más información de la película obtenida de la API
                  // Por ejemplo: reparto, duración, géneros, etc.
                  Center(
                    child: Text(
                      'Aquí se mostrará más información detallada de la película/serie (API)',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}