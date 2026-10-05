

import 'package:movie_verse/features/tv_show/domain/entities/genres_tv_show_list_entity.dart';

class GenresTvShowListModel extends GenresTvShowListEntity {
  GenresTvShowListModel({required super.id, required super.name});

  factory GenresTvShowListModel.fromjson(Map<String, dynamic> json) {
    return GenresTvShowListModel(id: json["id"], name: json["name"]);
  }
}
