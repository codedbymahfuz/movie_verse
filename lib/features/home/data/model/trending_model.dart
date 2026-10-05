import 'package:movie_verse/features/home/data/model/trending_result_model.dart';
import 'package:movie_verse/features/home/domain/entities/trending_entity.dart';

class TrendingModel extends TrendingEntity {
  TrendingModel({required super.results});

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      results: (json["results"] as List)
          .map((s) => TrendingResulstModel.fromJson(s))
          .toList(),
    );
  }
}
