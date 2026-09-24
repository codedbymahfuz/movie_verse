import 'package:movie_verse/features/movie/domain/entities/movie_result_entity.dart';

class ResultModel extends MovieResultEntity {
  ResultModel({
    required super.genreIds,
    required super.id,
    required super.title,
    required super.originalLanguage,
    required super.overView,
    required super.releaseDate,
    required super.originalTitle,
    required super.voteAverage,
    required super.posterPath,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'] ?? 0,
      overView: json["overview"],
      title: json['title'] ?? '',
      originalLanguage: json["original_language"],
      posterPath: json['poster_path'],
      originalTitle: json['original_title'] ?? '',
      releaseDate: json['release_date'],
      voteAverage: json["vote_average"],
      genreIds: json['genre_ids'] != null
        ? List<int>.from(json["genre_ids"].map((x)=> x as int)): []
    );
  }
}