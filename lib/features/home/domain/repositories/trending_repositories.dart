import 'package:movie_verse/features/home/domain/entities/trending_result_entity.dart';

abstract class TrendingRepositories {
  Future<List<TrendingResulstEntity>> getTrendingAll({
    required String timeWindow,
  });
}
