import 'package:flutter_bloc/flutter_bloc.dart';

class GenreCubit extends Cubit<int?> {
  GenreCubit() : super(null);

  void selectGenre(int? genreId) {
    if (state == genreId) return;

    emit(genreId);
  }
}


