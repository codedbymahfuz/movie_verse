import 'package:movie_verse/features/search/data/model/search_result_model.dart';
import 'package:movie_verse/features/search/domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  SearchModel({required super.results});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      results: (json["results"] as List)
          .map((s) => SearchResultModel.fromJson(s))
          .toList(),
    );
  }
}
