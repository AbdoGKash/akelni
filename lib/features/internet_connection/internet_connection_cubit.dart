import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription<List<ConnectivityResult>>? _streamSubscription;

  InternetConnectionCubit(this._streamSubscription)
      : super(InternetConnection());

  void connectionInternet() {
    _streamSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        emit(ConnectedState());
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        emit(ConnectedState());
      } else {
        emit(NotConnectedState());
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
