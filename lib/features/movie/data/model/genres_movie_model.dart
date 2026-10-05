import 'package:movie_verse/features/movie/data/model/genres_movie_list_model.dart';
import 'package:movie_verse/features/movie/domain/entities/genre_movie_entity.dart';

class GenresMovieModel extends GenresTvShowEntity {
  GenresMovieModel({required super.genres});

  factory GenresMovieModel.fromJson(Map<String, dynamic> json) {
    return GenresMovieModel(
      genres: (json["genres"] as List)
          .map((s) => GenresMovieListModel.fromJson(s))
          .toList(),
    );
  }
}
