part of 'internetconnectivity_cubit.dart';

@immutable
abstract class InternetconnectivityState {}

class InternetconnectivityInitial extends InternetconnectivityState {}

class InternetConnected extends InternetconnectivityState {
  final bool connect;
  InternetConnected({
    required this.connect,
  });
}
