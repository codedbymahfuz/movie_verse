

import 'package:movie_verse/features/tv_show/data/model/genres_tv_show_model.dart';
import 'package:movie_verse/features/tv_show/data/model/tv_show_model.dart';

abstract class TvShowRemoteDataSource {
  Future<TvShowModel> getPopularTvShow({required int page});

  Future<TvShowModel> getTopRatedTvShow({required int page});

  Future<TvShowModel> getGenreTvShow({required int genre, required int page});

  Future<GenresTvShowModel> getTvShowGenresItem ();
}
