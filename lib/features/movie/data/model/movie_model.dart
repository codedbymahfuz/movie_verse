import 'package:movie_verse/features/movie/data/model/movie_result_model.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({required super.results});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      results: (json["results"] as List)
          .map((s) => ResultModel.fromJson(s))
          .toList(),
    );
  }
}


