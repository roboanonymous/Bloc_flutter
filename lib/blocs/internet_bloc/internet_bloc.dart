import 'dart:async';

import 'package:blflutter/blocs/internet_bloc/internet_event.dart';
import 'package:blflutter/blocs/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription ? connectivitysubscription;

  InternetBloc() : super(InternetInitialState()){

     on<InternnetLostEvent>((event, emit) => emit(InternnetLostState()));
     on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

     connectivitysubscription =  _connectivity.onConnectivityChanged.listen((result) {

      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi)
      {
        add(InternetGainedEvent());
      }
      else{
        add(InternnetLostEvent());
      }

      });
  }

  @override
  Future<void> close() {
    connectivitysubscription?.cancel();
    return super.close();
  }
 

}