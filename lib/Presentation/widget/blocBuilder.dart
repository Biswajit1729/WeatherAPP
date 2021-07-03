import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_api_bloc_project/Logic/cubit/weather_cubit.dart';

buildBlocBuilder(String name) {
  return BlocBuilder<WeatherCubit, WeatherState>(
    builder: (context, state) {
      if (state is WeatherLoading) {
        return Container(
            height: 15, width: 15, child: const CircularProgressIndicator());
      } else if (state is WeatherLoaded) {
        //return texFilup(name);
        return textMethod(name, state);
      } else if (state is WeatherError) {
        return Center(
          child: Text(
            state.error.toString(),
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      } else {
        return Container();
      }
    },
  );
}

textMethod(String name, state) {
  var url = 'http://openweathermap.org/img/w/' + state.icon.toString() + '.png';
  switch (name) {
    case 'location':
      return Text(
        state.name.toString(),
        style: GoogleFonts.lato(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

    case 'temp':
      return Text(
        state.temp.toString() + ' \u00B0 C',
        style: GoogleFonts.lato(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

    case 'description':
      return Text(
        state.description.toString(),
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );
    case 'wind':
      return Text(
        state.windSpeed.toString(),
        style: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

    case 'Humidy':
      return Text(
        state.humidity.toString(),
        style: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    case 'rain':
      return Text(
        state.rain.toString(),
        style: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

    case 'icon':
      //print(iconUrl + state.icon.toString() + ".png");
      return Image.network(url);
    case 'humidityPerstent':
      return footerpersentbar(state.humidity);
    case 'rainPerstent':
      return footerpersentbar(state.rain);
    case 'windpersent':
      return footerpersentbar(state.windSpeed);

    default:
      return Text('');
  }
}

footerpersentbar(state) {
  double width = double.parse(state);
  Color color = Colors.black;
  if (width > 80) {
    color = Colors.red;
  } else if (width < 80 && width > 50) {
    color = Colors.redAccent;
  } else if (width < 50 && width > 30) {
    color = Colors.blueAccent;
  } else if (width < 30) {
    color = Colors.blue;
  } else {}
  return Container(
    height: 5,
    width: width,
    color: color,
  );
}
