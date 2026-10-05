import 'package:movie_verse/features/movie/domain/entities/genres_movie_list_entity.dart';

class GenresMovieListModel extends GenresMovieListEntity {
  GenresMovieListModel({required super.id, required super.name});

  factory GenresMovieListModel.fromJson(Map<String, dynamic> json) {
    return GenresMovieListModel(id: json["id"], name: json["name"]);
  }
}
