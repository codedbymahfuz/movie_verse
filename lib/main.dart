
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/movie/data/datasource/movie_remote_data_source_impl.dart';
import 'package:movie_verse/features/movie/data/repositories/repositories_impl.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_verse/features/tv_show/data/datasource/tv_show_remote_data_source_impl.dart';
import 'package:movie_verse/features/tv_show/data/repositories/repositories_impl.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:movie_verse/my_app.dart';

void main() {

  final dataSourceMovie = MovieRemoteDataSourceImpl();

  final repoMovie = MovieRepositoryImpl(remoteDataSource: dataSourceMovie);

  final dataSourceTv = TvShowRemoteDataSourceImpl();

  final repoTv = TvShowRepositoryImpl(remoteDataSource: dataSourceTv);

   runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TvShowBloc(repository: repoTv) ),

        BlocProvider(create: (context) => MovieBloc(repository: repoMovie) ),

        BlocProvider(create: (context) => MovieExploreBloc(repository: repoMovie) ),

      ],
      child: const MyApp(),
    )
   );
}
