import 'package:movie_verse/features/tv_show/domain/entities/tv_show_result_entity.dart';

class TvShowResultModel extends TvShowResultEntity {
  TvShowResultModel({
    required super.id,
    required super.name,
    required super.overView,
    required super.originalLanguage,
    required super.firstAirDate,
    required super.originalTitle,
    required super.genreIds,
    required super.posterPath,
  });

  factory TvShowResultModel.fromJson(Map<String, dynamic> json) {
    return TvShowResultModel(
      id: json['id'] ?? 0,
      overView: json["overview"],
      originalLanguage: json["original_language"],
      name: json['name'] ?? '',
      posterPath: json['poster_path'],
      originalTitle: json['original_title'] ?? '',
      firstAirDate: json['first_air_date'],
      genreIds: json['genre_ids'] != null
          ? List<int>.from(json["genre_ids"].map((genre) => genre as int))
          : [],
    );
  }
}
