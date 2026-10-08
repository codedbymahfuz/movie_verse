import 'package:movie_verse/features/tv_show/domain/entities/tv_show_result_entity.dart';

class TvShowResultModel extends TvShowResultEntity {
  TvShowResultModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.originalLanguage,
    super.genreIds,
    super.posterPath,
    super.backdropPath,
    super.originalName,
    super.firstAirDate,
    super.originCountry,
    super.popularity,
    super.softcore,
    super.voteAverage,
    super.voteCount,
  });

  factory TvShowResultModel.fromJson(Map<String, dynamic> json) {
    return TvShowResultModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      originalName: json['original_name'],
      firstAirDate: json['first_air_date'],
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'].map((x) => x.toString()))
          : null,
      popularity: (json['popularity'] as num?)?.toDouble(),
      softcore: json['adult'], 
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'],
      genreIds: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids'].map((x) => x as int))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overview': overview,
      'original_language': originalLanguage,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'original_name': originalName,
      'first_air_date': firstAirDate,
      'origin_country': originCountry,
      'popularity': popularity,
      'adult': softcore,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
    };
  }
}