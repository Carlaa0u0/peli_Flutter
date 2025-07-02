class Movie {
  final String id;
  final String title;
  final String name;
  final String posterPath;
  final String? backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.name,
    required this.posterPath,
    this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  // Método de fábrica para crear una instancia de Movie desde un mapa JSON
  // Este método se usaría cuando se consume una API real.
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(),
      title: json['title'] ?? 'Título Desconocido',
      name: json['name'] ?? 'Título Desconocido',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'],
      overview: json['overview'] ?? 'Sin descripción.',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? 'Fecha Desconocida',
    );
  }
}