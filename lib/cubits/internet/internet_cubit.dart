

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState>{


  final Connectivity connectivity;
  late StreamSubscription streamSubscription;
  InternetCubit({required this.connectivity}) : assert(connectivity != null),super(InternetLoading()){

    streamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult){
      if(connectivityResult == ConnectivityResult.wifi){
        emit(InternetConnected(ConnectionType.wifi));
      }else if(connectivityResult == ConnectivityResult.mobile){
        emit(InternetConnected(ConnectionType.mobile));
      }else if(connectivityResult == ConnectivityResult.none){
        emit(InternetDisConnected());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

}