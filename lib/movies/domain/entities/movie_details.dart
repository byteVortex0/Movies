import 'package:equatable/equatable.dart';
import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<Genres> genres;
  final String overview;
  final int runtime;
  final double voteAverage;
  final String releaseDate;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.voteAverage,
    required this.runtime,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      genres,
      overview,
      runtime,
      voteAverage,
      releaseDate,
    ];
  }
}
