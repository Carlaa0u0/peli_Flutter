class Movie {
  final String id;
  final String title;
  final String posterPath;
  final String? backdropPath; // Puede ser nulo
  final String overview;
  final double voteAverage;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    this.backdropPath, // Opcional
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });


  factory Movie.fromJson(Map<String, dynamic> json) {

    final String title = json['title'] ?? json ['name'] ?? 'Titulo Desconocido'; 
    final String releaseDate = json['release_date'] ?? json['first_air_date'] ?? 'Fecha Desconocida';


    return Movie(
      id: json['id'].toString(), // Asegura que el ID sea String
      title: title, // Proporciona un valor por defecto si es nulo
      posterPath: json['poster_path'] ?? '', // Ruta del póster, vacía si es nula
      backdropPath: json['backdrop_path'], // Ruta del fondo, puede ser nula
      overview: json['overview'] ?? 'Sin descripción.', // Descripción, valor por defecto si es nula
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0, // Calificación, 0.0 por defecto
      releaseDate: releaseDate // Fecha de estreno, valor por defecto
    );
  }
}
