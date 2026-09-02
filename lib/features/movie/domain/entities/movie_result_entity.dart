class MovieResultEntity {
  final int id;
  final String title;
  final String overView;
  final String? posterPath;
  final String originalTitle;
  final String releaseDate;

  MovieResultEntity({
    required this.id,
    required this.title,
    required this.overView,
    this.posterPath,
    required this.originalTitle,
    required this.releaseDate,
  });
}