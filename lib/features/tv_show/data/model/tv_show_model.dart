import 'package:movie_verse/features/tv_show/data/model/tv_show_result_model.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';

class TvShowModel extends TvShowEntity {
  TvShowModel({required super.results});

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      results: (json["results"] as List)
          .map((s) => TvShowResultModel.fromJson(s))
          .toList(),
    );
  }
}
