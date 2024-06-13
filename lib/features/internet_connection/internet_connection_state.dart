part of 'internet_connection_cubit.dart';

sealed class InternetConnectionState {
  const InternetConnectionState();
}

final class InternetConnection extends InternetConnectionState {}

class ConnectedState extends InternetConnectionState {}

class NotConnectedState extends InternetConnectionState {}
