import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkCubit extends Cubit<bool>{

 final Connectivity _connectivity = Connectivity();

 StreamSubscription<List<ConnectivityResult>>? _streamSubscription;

  NetworkCubit() : super (true) {
     _listenNetwork();
  }

   void _listenNetwork () {
    
      _streamSubscription = _connectivity.onConnectivityChanged.listen(
        (results){
         final isConnected = results.any((result)=> result != ConnectivityResult.none);

         emit(isConnected);
        });
   }

   @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}