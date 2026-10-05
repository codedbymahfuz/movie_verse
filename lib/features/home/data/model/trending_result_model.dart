import 'package:movie_verse/features/home/domain/entities/trending_result_entity.dart';

class TrendingResulstModel extends TrendingResulstEntity {
  TrendingResulstModel({
    required super.adult,
    super.backdropPath,
    required super.id,
    super.title,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    required super.posterPath,
    required super.mediaType,
    super.genreIds,
    required super.popularity,
    super.releaseDate,
    super.video,
    required super.voteAverage,
    required super.voteCount,
    super.name,
    super.originalName,
    super.firstAirDate,
    super.originCountry,
  });

  factory TrendingResulstModel.fromJson(Map<String, dynamic> json) {
    return TrendingResulstModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'],
      title: json['title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      genreIds: json['genre_ids'].cast<int>()  ?? '',
      popularity: json['popularity'] ?? '',
      releaseDate: json['release_date'] ?? '',
      video: json['video'],
      voteAverage: json['vote_average'] ?? '',
      voteCount: json['vote_count'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      originCountry: json['origin_country'].cast<String>() ?? '' ,
    );
  }
}
