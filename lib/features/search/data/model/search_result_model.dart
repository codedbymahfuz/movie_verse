import 'package:movie_verse/features/search/domain/entities/search_result_entity.dart';

class SearchResultModel extends SearchResultsEntity {
  SearchResultModel({
    super.adult,
    super.backdropPath,
    super.id,
    super.title,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.posterPath,
    super.mediaType,
    super.genreIds,
    super.popularity,
    super.releaseDate,
    super.video,
    super.voteAverage,
    super.voteCount,
    super.name,
    super.originalName,
    super.firstAirDate,
    super.originCountry,
  });

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'] ?? name;
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids']?.cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    name = json['name'] ?? title;
    originalName = json['original_name'];
    firstAirDate = json['first_air_date'];
    originCountry = (json['origin_country'] as List?)?.cast<String>() ?? [];
  }

  @override
  String get displayTitle  {
    if(title != null && title!.isNotEmpty) return title!;
    if(name != null && name!.isNotEmpty) return name!;

    return "Unknow name";
  }

  @override
  String get displayPath {
    return posterPath ?? backdropPath ?? '';
  }
}
