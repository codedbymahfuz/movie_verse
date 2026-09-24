class TvShowResultEntity {
  final int id;
  final String name;
  final String overView;
  final String originalLanguage;                      
  final List<int> genreIds;
  final String posterPath;
  final String originalTitle;
  final String firstAirDate;

  TvShowResultEntity({
    required this.id,
    required this.name,
    required this.overView,
    required this.originalLanguage,
    required this.genreIds,
    required this.posterPath,
    required this.originalTitle,
    required this.firstAirDate,
  });
}