class MovieResultEntity {
  final int id;
  final String title;
  final String overview;
  final String originalLanguage;
  final String originalTitle;
  final String? backdropPath;
  final List<int>? genreIds;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final bool? softcore;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieResultEntity({
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    this.backdropPath,
    this.genreIds,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.softcore,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
}
