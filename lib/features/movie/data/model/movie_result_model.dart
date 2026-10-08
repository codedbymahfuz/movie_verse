import 'package:movie_verse/features/movie/domain/entities/movie_result_entity.dart';

class ResultModel extends MovieResultEntity {
  ResultModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.originalLanguage,
    required super.originalTitle,
    super.backdropPath,
    super.genreIds,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.softcore,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble(),
      softcore: json['adult'], // TMDB API তে 'adult' থাকে
      video: json['video'],
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
      genreIds: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids'].map((x) => x as int))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'popularity': popularity,
      'adult': softcore,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
    };
  }
}