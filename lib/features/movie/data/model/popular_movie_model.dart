import 'package:movie_verse/features/movie/domain/entities/popular_movie_entity.dart';

class PopularMovieModel extends PopularMovieEntity {
  PopularMovieModel({required super.results});

  factory PopularMovieModel.fromJson(Map<String, dynamic> json) {
    return PopularMovieModel(
      results: (json["results"] as List)
          .map((s) => ResultModel.fromJson(s))
          .toList(),
    );
  }
}

class ResultModel extends ResultEntity {
  ResultModel({
    required super.id,
    required super.title,
    required super.overView,
    required super.releaseDate,
    required super.originalTitle,
    super.posterPath,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'] ?? 0,
      overView: json["overview"],
      title: json['title'] ?? '',
      posterPath: json['poster_path'],
      originalTitle: json['original_title'] ?? '',
      releaseDate: json['release_date'],
    );
  }
}
