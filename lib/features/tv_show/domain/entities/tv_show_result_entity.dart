class TvShowResultEntity {
  int id;
  String name;
  String overview;
  String originalLanguage;
  List<int>? genreIds;
  String? posterPath;
  String? backdropPath; 
  String? originalName;
  String? firstAirDate;
  List<String>? originCountry;
  double? popularity;   
  bool? softcore;
  double? voteAverage;
  int? voteCount;

  TvShowResultEntity({
    required this.id,
    required this.name,
    required this.overview,
    required this.originalLanguage,
    this.genreIds, 
    this.posterPath,
    this.backdropPath,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
    this.popularity,
    this.softcore,
    this.voteAverage,
    this.voteCount,
  });
}