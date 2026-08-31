import 'package:flutter/foundation.dart';
import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/service/api_service.dart';
import 'package:movie_verse/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_verse/features/movie/data/model/popular_movie_model.dart';


class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
 

  @override
  Future<PopularMovieModel> getPopularMovies() async {
    
    final uri = "${MovieApiEndpoints.popularMovies}${MovieApiEndpoints.apiKey}";

    final response = await ApiService.getMovie(uri);

    if (response.isSuccess) {

      debugPrint("Response is Success - ${response.statusCode}");
      
       

      return PopularMovieModel.fromJson(response.responsiveData);

       
    }

    throw Exception("Something Wrong");

  }
}
