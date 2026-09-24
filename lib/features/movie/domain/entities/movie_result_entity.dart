class MovieResultEntity {
  final int id;
  final String title;
  final String originalLanguage;
  final String overView;
  final List<int> genreIds;
  final String posterPath;
  final String originalTitle;
  final double voteAverage;
  final String releaseDate;

  MovieResultEntity({
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.overView,
    required this.genreIds,
    required this.posterPath,
    required this.originalTitle,
    required this.voteAverage,
    required this.releaseDate,
  });
}