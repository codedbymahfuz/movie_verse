import 'package:movie_verse/features/movie/data/model/genres_movie_list_model.dart';
import 'package:movie_verse/features/movie/domain/entities/genre_movie_entity.dart';

class GenresTvShowModel extends GenresTvShowEntity {
  GenresTvShowModel({required super.genres});

  factory GenresTvShowModel.fromjson(Map<String, dynamic> json) {
    return GenresTvShowModel(
      genres: (json["genres"] as List)
          .map((s) => GenresMovieListModel.fromJson(s))
          .toList(),
    );
  }
}
