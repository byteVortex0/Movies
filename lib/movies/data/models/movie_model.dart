import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.generIds,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        generIds: List<int>.from(json['gener_ids'].map((e) => e)),
        overView: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'backdrop_path': backdropPath,
      'gener_ids': generIds,
      'overview': overView,
      'vote_average': voteAverage,
      'release_date': releaseDate,
    };
  }
}
