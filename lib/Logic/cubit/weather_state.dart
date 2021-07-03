part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {
  final bool? loading;
  final String? error;
  WeatherLoading({this.loading, this.error});
}

class WeatherLoaded extends WeatherState {
  final String? temp;
  final String? humidity;
  final String? windSpeed;
  final String? rain;
  final String? name;
  final String? icon;
  final String? description;
  WeatherLoaded({
    this.temp,
    this.humidity,
    this.windSpeed,
    this.rain,
    this.name,
    this.icon,
    this.description,
  });
}

class WeatherError extends WeatherState {
  final String? error;
  WeatherError({
    this.error,
  });
}
