 class PopularMovieEntity {
  final List<ResultEntity> results;

  PopularMovieEntity({
    required this.results,
  });
}

class ResultEntity {
  final int id;
  final String title;
  final String overView;
  final String? posterPath;
  final String originalTitle;
  final String releaseDate;

  ResultEntity({
    required this.id,
    required this.title,
    required this.overView,
    this.posterPath,
    required this.originalTitle,
    required this.releaseDate,
  });
}