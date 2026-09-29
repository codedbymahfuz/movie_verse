import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/genre_cubit.dart';
import 'package:movie_verse/features/home/presentation/cubit/trending_tab_cubit.dart';
import 'package:movie_verse/my_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GenreCubit()),
        BlocProvider(create: (_) => TrendingTabCubit()),
      ],
      child: const MyApp(),
    ),
  );
}