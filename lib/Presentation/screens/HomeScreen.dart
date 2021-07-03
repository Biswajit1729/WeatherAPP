import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_api_bloc_project/Logic/cubit/internetconnectivity_cubit.dart';
import 'package:simple_api_bloc_project/Logic/cubit/weather_cubit.dart';
import 'package:simple_api_bloc_project/Presentation/screens/single_weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String bgImg =
      'https://i.pinimg.com/564x/2b/82/59/2b8259773f339ca2035dc3eea94dcd1d.jpg';
  Widget appBarTitle = new Center(child: Text("Weather"));
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    print('conter');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: appBarTitle,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                context.read<InternetconnectivityCubit>().checkInternet();
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = new Icon(Icons.close);
                    this.appBarTitle = new TextField(
                      onSubmitted: (value) {
                        context.read<WeatherCubit>().loadWeatherData(value);
                      },
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Location...",
                        hintStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    this.actionIcon = new Icon(Icons.search);
                    this.appBarTitle = new Center(child: Text("Weather"));
                  }
                });
              },
              icon: actionIcon)
        ],
      ),
      body: BlocBuilder<InternetconnectivityCubit, InternetconnectivityState>(
          builder: (context, state) {
        if (state is InternetConnected) {
          print(state.connect);
          if (state.connect) {
            return Container(
              child: Stack(
                children: [
                  Image.network(
                    bgImg,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black54),
                  ),
                  SingleWeather(),
                ],
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Text(
                  "No internet",
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }
        } else {
          return Container();
        }
      }),
    );
  }
}
