import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/service/api_service.dart';
import 'package:movie_verse/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_verse/features/movie/data/model/genres_movie_model.dart';
import 'package:movie_verse/features/movie/data/model/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<MovieModel> getPopularMovies({required int page}) async {
    final uri =
        "${TmdbApiEndpoints.popularMovies}?${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      return MovieModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }

  @override
  Future<MovieModel> getTopRatedMovies({required int page}) async {
    final uri =
        "${TmdbApiEndpoints.topRatedMovies}?${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      return MovieModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }

  @override
  Future<MovieModel> getUpComingMovies({required int page}) async {
    final uri =
        "${TmdbApiEndpoints.upcomingMovies}?${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      return MovieModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }

  @override
  Future<MovieModel> getAllMovies({required int page}) async {
    final uri =
        "${TmdbApiEndpoints.allMovie}?${TmdbApiEndpoints.apiKey}&page= $page";

    final response = await ApiService.getRequest(uri);
    if (response.isSuccess) {
      return MovieModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }

  @override
  Future<MovieModel> getNewMovie({required int page}) async {
    final uri =
        "${TmdbApiEndpoints.newMovie}?${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);
    if (response.isSuccess) {
      return MovieModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }

  @override
  Future<MovieModel> getGenreMovie({
    required int genre,
    required int page,
  }) async {
    final uri =
        "${TmdbApiEndpoints.movieGenre}$genre&${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      return MovieModel.fromJson(response.responsiveData);
    }

    throw Exception(response.errorMessage);
  }

  @override
  Future<GenresMovieModel> getMovieGenresItem() async {
    final uri = "${TmdbApiEndpoints.genresIdMovie}?${TmdbApiEndpoints.apiKey}";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      return GenresMovieModel.fromJson(response.responsiveData);
    }

    throw Exception(response.errorMessage);
  }
}
