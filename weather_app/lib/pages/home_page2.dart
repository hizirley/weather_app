import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/consts.dart';
import 'package:weather_app/functions.dart';

class HomePageWeather2 extends StatefulWidget {
  final String selectedCity;
  const HomePageWeather2({Key? key, required this.selectedCity})
      : super(key: key);

  @override
  State<HomePageWeather2> createState() => _HomePageWeather2State();
}

class _HomePageWeather2State extends State<HomePageWeather2> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName(widget.selectedCity).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            //ilk Container
            Container(
              margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: _weather != null
                  ? Center(
                      child: locationHeaderWidget(context, _weather),
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
            //ikinci container
            Container(
              height: MediaQuery.sizeOf(context).height * 0.6,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: _weather != null
                        ? Center(
                            child: dateTimeInfoWidget(context, _weather),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                  Container(
                    child: _weather != null
                        ? Center(
                            child: weatherIconWidget(context, _weather),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                  Container(
                    child: _weather != null
                        ? Center(
                            child: currentTempWidget(context, _weather),
                          )
                        : Center(child: CircularProgressIndicator()),
                  )
                ],
              ),
            ),

            Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: _weather != null
                        ? Center(
                            child: extraInfoWidget(context, _weather),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
