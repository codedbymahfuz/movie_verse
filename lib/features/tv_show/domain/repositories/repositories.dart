

import 'package:movie_verse/features/movie/domain/entities/genre_movie_entity.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';

abstract class TvShowRepository {

  Future<TvShowEntity> getPopularTvShow({required int page});

  Future<TvShowEntity> getTopRatedTvShow({required int page});

  Future<TvShowEntity> getGenreTvShow({required int genre, required int page});

  Future<GenresTvShowEntity> getGenreTvShowItem ();
}
