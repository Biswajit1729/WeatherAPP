import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_api_bloc_project/Data/Repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial()) {
    loadWeatherData('Assam');
  }
  loadWeatherData(String location) async {
    emit(WeatherLoading(loading: false));
    var weatherData = await weatherRepository(location);

    if (weatherData != 'No record') {
      double temperatureKelvin = weatherData.main.temp;
      String temperatureCelsius =
          (temperatureKelvin - 273.15).toStringAsFixed(1);
      emit(WeatherLoading(loading: false));

      emit(WeatherLoaded(
          description: weatherData!.weather[0].description.toString(),
          temp: temperatureCelsius,
          name: weatherData.name.toString(),
          icon: weatherData.weather[0].icon.toString(),
          humidity: weatherData.main.humidity.toString(),
          windSpeed: weatherData.wind.speed.toString(),
          rain: weatherData.clouds.all.toString()));
    } else {
      emit(WeatherError(error: weatherData));
      print("weather is giving null value");
    }
  }
}
