import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/genre_cubit.dart';
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
import 'package:movie_verse/my_app.dart';

void main() {

  final trendingDataSource = TrendingRemoteDataSource();
  final movieDataSource = MovieRemoteDataSourceImpl();
  final tvDataSource = TvShowRemoteDataSourceImpl();
  final searchDataSource = SearchRemoteDataSource();

  final videoDataSource = VideoRemoteDataSource();

  final trendingRepo = TrendingRepoImpl(remoteDataSource: trendingDataSource);
  final movieRepo = MovieRepositoryImpl(remoteDataSource: movieDataSource);
  final tvShowRepo =TvShowRepositoryImpl(remoteDataSource: tvDataSource);
 final searchRepo = SearchRepoImpl(remoteDataSource: searchDataSource);

final videoRepo = VideoRepoImpl(remoteDataSource: videoDataSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GenreCubit()),
        

        BlocProvider(create: (_) => VideoBloc(repository: videoRepo)),

        BlocProvider(create: (_) => MovieBloc(repository: movieRepo)),

        BlocProvider(create: (_) => TvShowBloc(repository: tvShowRepo)),

        BlocProvider(create: (_) => SearchBloc(repositories: searchRepo)),

        BlocProvider(create: (_) => MovieExploreBloc(repository: movieRepo)),

        BlocProvider(create: (_) => MovieGenresBloc(repository: movieRepo)),

        BlocProvider(create: (_) => TvShowGenresBloc(repository: tvShowRepo)),

        BlocProvider(create: (_)=> HomeBloc(
        movieRepository: movieRepo, 
        tvShowRepository: tvShowRepo, 
        trendingRepositories: trendingRepo),
       ),
      ],
      child: const MyApp(),
    ),
  );
}