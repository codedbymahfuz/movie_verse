import 'package:movie_verse/features/tv_show/data/model/tv_show_model.dart';

abstract class TvShowRemoteDataSource {

  Future<TvShowModel> getPopularTvShow({required int page});

  Future<TvShowModel> getTopRatedTvShow({required int page});

  
}