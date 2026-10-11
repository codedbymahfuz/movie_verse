

class SearchResultsEntity {
  bool? adult;
  String? backdropPath;
  int id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? name;
  String? originalName;
  String? firstAirDate;
  List<String>? originCountry;

  SearchResultsEntity(
      {this.adult,
      this.backdropPath,
      required this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.name,
      this.originalName,
      this.firstAirDate,
      this.originCountry});

      String get displayTitle  {
    if(title != null && title!.isNotEmpty) return title!;
    if(name != null && name!.isNotEmpty) return name!;

    return "Unknow name";
  }

   String get displayPath {
    return posterPath ?? backdropPath ?? '';
  }

   String get mediareleaseDate {
    return releaseDate ?? firstAirDate ?? '';
  }
  

}
