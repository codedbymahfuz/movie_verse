import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/genre_cubit.dart';
import 'package:movie_verse/core/di/injection.dart';
import 'package:movie_verse/core/cubit/network_cubit.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_bloc.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_bloc.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movie_verse/features/video/presentation/bloc/video_bloc.dart';
import 'package:movie_verse/my_app.dart';

void main() {
  setupDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GenreCubit()),

        BlocProvider(create: (_) => NetworkCubit()),

        BlocProvider(create: (_) => getIt<HomeBloc>()),

        BlocProvider(create: (_) => getIt<VideoBloc>()),

        BlocProvider(create: (_) => getIt<MovieBloc>()),

        BlocProvider(create: (_) => getIt<TvShowBloc>()),

        BlocProvider(create: (_) => getIt<SearchBloc>()),

        BlocProvider(create: (_) => getIt<MovieExploreBloc>()),

        BlocProvider(create: (_) => getIt<MovieGenresBloc>()),

        BlocProvider(create: (_) => getIt<TvShowGenresBloc>()),
        
      ],
      child: const MyApp(), 
    ),
  );
}

 