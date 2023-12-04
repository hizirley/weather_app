import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

Widget locationHeaderWidget(BuildContext context, Weather? weather) {
  return Text(
    weather?.areaName ?? "",
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  );
}

Widget dateTimeInfoWidget(BuildContext context, Weather? weather) {
  DateTime now = weather!.date!;
  return Column(
    children: [
      Text(
        DateFormat('dd').format(now),
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat('dd.MM.yy').format(now),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      )
    ],
  );
}

Widget weatherIconWidget(BuildContext context, Weather? weather) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "http://openweathermap.org/img/wn/${weather?.weatherIcon}@4x.png",
            ),
          ),
        ),
      ),
      Text(
        weather?.weatherDescription ?? "",
        style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20),
      ),
    ],
  );
}

Widget currentTempWidget(BuildContext context, Weather? weather) {
  return Text(
    "${weather?.temperature?.celsius}".split(".")[0] + "°C",
    style: TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 90,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget extraInfoWidget(BuildContext context, Weather? weather) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    width: MediaQuery.of(context).size.width * 0.80,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Max:${weather?.tempMax?.celsius}".split(".")[0] + "°C",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              "Min:${weather?.tempMin?.celsius}".split(".")[0] + "°C",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Wind:${weather?.windSpeed}" /*.split(".")[0] */ + " m/s",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              "Humidity:${weather?.humidity}" /*.split(".")[0]*/ + " %",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
      ],
    ),
  );
}

Future<String> getCurrentCity() async {
  //get permissions from user
  LocationPermission permisson = await Geolocator.checkPermission();
  if (permisson == LocationPermission.denied) {
    permisson = await Geolocator.requestPermission();
  }
  //fetch the current location
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  //convert the location into a list of placemark objects
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  //extract the city name from the first placemark
  String? city = placemarks[0].locality;
  return city ?? "";
}
