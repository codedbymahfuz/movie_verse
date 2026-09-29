import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingTabCubit extends Cubit<int> {
  TrendingTabCubit() : super(0);

  void switchButtonTrending(int count) {
    emit(count);
  }
}