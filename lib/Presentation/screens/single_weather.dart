import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_api_bloc_project/Presentation/widget/blocBuilder.dart';

class SingleWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    buildBlocBuilder('location'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()),
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBlocBuilder('temp'),
                    Row(
                      children: [
                        buildBlocBuilder('icon'),
                        SizedBox(
                          width: 10,
                        ),
                        buildBlocBuilder('description'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Wind',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        buildBlocBuilder('wind'),
                        Text(
                          'm/s',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 100,
                              color: Colors.white38,
                            ),
                            buildBlocBuilder('windpersent'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'rain',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        buildBlocBuilder('rain'),
                        Text(
                          '%',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 100,
                              color: Colors.white38,
                            ),
                            buildBlocBuilder('rainPerstent'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Humidy',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        buildBlocBuilder('Humidy'),
                        Text(
                          '%',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 100,
                              color: Colors.white38,
                            ),
                            buildBlocBuilder('humidityPerstent'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
