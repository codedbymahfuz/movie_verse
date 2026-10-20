import 'package:get_it/get_it.dart';
import 'package:movie_verse/features/home/data/datasource/trending_remote_data_source.dart';
import 'package:movie_verse/features/home/data/repositories/trending_repo_impl.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_verse/features/movie/data/datasource/movie_remote_data_source_impl.dart';
import 'package:movie_verse/features/movie/data/repositories/repositories_impl.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_verse/features/search/data/datasource/search_remote_data_source.dart';
import 'package:movie_verse/features/search/data/repositories/search_repo_impl.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_bloc.dart';
import 'package:movie_verse/features/tv_show/data/datasource/tv_show_remote_data_source_impl.dart';
import 'package:movie_verse/features/tv_show/data/repositories/repositories_impl.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_bloc.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movie_verse/features/video/data/datasource/video_remote_data_source.dart';
import 'package:movie_verse/features/video/data/repositories/video_repo_impl.dart';
import 'package:movie_verse/features/video/presentation/bloc/video_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<TrendingRemoteDataSource>(
    () => TrendingRemoteDataSource(),
  );

  getIt.registerLazySingleton<MovieRemoteDataSourceImpl>(
    () => MovieRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<TvShowRemoteDataSourceImpl>(
    () => TvShowRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSource(),
  );

  getIt.registerLazySingleton<VideoRemoteDataSource>(
    () => VideoRemoteDataSource(),
  );
  //----

  getIt.registerLazySingleton<TrendingRepoImpl>(
    () => TrendingRepoImpl(remoteDataSource: getIt<TrendingRemoteDataSource>()),
  );

  getIt.registerLazySingleton<MovieRepositoryImpl>(
    () => MovieRepositoryImpl(
      remoteDataSource: getIt<MovieRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerLazySingleton<TvShowRepositoryImpl>(
    () => TvShowRepositoryImpl(
      remoteDataSource: getIt<TvShowRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(remoteDataSource: getIt<SearchRemoteDataSource>()),
  );

  getIt.registerLazySingleton<VideoRepoImpl>(
    () => VideoRepoImpl(remoteDataSource: getIt<VideoRemoteDataSource>()),
  );

 // bloc ------------

  getIt.registerFactory<HomeBloc>(()=> HomeBloc(
    movieRepository: getIt<MovieRepositoryImpl>(),
    tvShowRepository: getIt<TvShowRepositoryImpl>(), 
    trendingRepositories: getIt<TrendingRepoImpl>(),
  ),
);

 getIt.registerFactory<MovieBloc>(()=> MovieBloc(
  repository: getIt<MovieRepositoryImpl>(),
),
);

 getIt.registerFactory<MovieExploreBloc>(
  () => MovieExploreBloc(
    repository: getIt<MovieRepositoryImpl>(),
  ),
);

 getIt.registerFactory<TvShowBloc>(()=> TvShowBloc(
  repository: getIt<TvShowRepositoryImpl>(),
),
);

 getIt.registerFactory<SearchBloc>(()=> SearchBloc(
  repositories: getIt<SearchRepoImpl>(), 
),
);

 getIt.registerFactory<MovieGenresBloc>(()=> MovieGenresBloc(
  repository: getIt<MovieRepositoryImpl>(),
),
);

getIt.registerFactory<TvShowGenresBloc>(()=> TvShowGenresBloc(
  repository: getIt<TvShowRepositoryImpl>(),
),
);

 

 getIt.registerFactory<VideoBloc>(()=> VideoBloc(
  repository: getIt<VideoRepoImpl>(), 
 ),
);
  
}
