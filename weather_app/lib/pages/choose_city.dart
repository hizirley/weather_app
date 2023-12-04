import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page2.dart';
import 'package:weather_app/theme/dark_theme.dart';
import 'package:weather_app/theme/light_theme.dart';

void main() {
  runApp(ChooseCity());
}

class ChooseCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme, // Varsayılan tema
      darkTheme: DarkTheme, // Koyu tema
      title: 'W E A T H E R',

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'W E A T H E R',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        body: Center(
          child: CitySelectionButton(),
        ),
      ),
    );
  }
}

class CitySelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(250, 70),
        primary: Theme.of(context)
            .colorScheme
            .tertiary, // Arka plan rengi burada belirtiliyor
      ),
      onPressed: () {
        _openCitySelectionDialog(context);
      },
      child: Text(
        'Choose Location',
        style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }

  void _openCitySelectionDialog(BuildContext context) async {
    String? selectedCity = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a City',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
          content: CitySelectionDialogContent(),
        );
      },
    );

    if (selectedCity != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePageWeather2(selectedCity: selectedCity),
        ),
      );
    }
  }
}

class CitySelectionDialogContent extends StatelessWidget {
  final List<String> cities = [
    'Adana',
    'Adıyaman',
    'Afyonkarahisar',
    'Ağrı',
    'Amasya',
    'Ankara',
    'Antalya',
    'Artvin',
    'Aydın',
    'Balıkesir',
    'Bilecik',
    'Bingöl',
    'Bitlis',
    'Bolu',
    'Burdur',
    'Bursa',
    'Çanakkale',
    'Çankırı',
    'Çorum',
    'Denizli',
    'Diyarbakır',
    'Edirne',
    'Elâzığ',
    'Erzincan',
    'Erzurum',
    'Eskişehir',
    'Gaziantep',
    'Giresun',
    'Gümüşhane',
    'Hakkâri',
    'Hatay',
    'Isparta',
    'Mersin',
    'İstanbul',
    'İzmir',
    'Kars',
    'Kastamonu',
    'Kayseri',
    'Kırklareli',
    'Kırşehir',
    'Kocaeli',
    'Konya',
    'Kütahya',
    'Malatya',
    'Manisa',
    'Kahramanmaraş',
    'Mardin',
    'Muğla',
    'Muş',
    'Nevşehir',
    'Niğde',
    'Ordu',
    'Rize',
    'Sakarya',
    'Samsun',
    'Siirt',
    'Sinop',
    'Sivas',
    'Tekirdağ',
    'Tokat',
    'Trabzon',
    'Tunceli',
    'Şanlıurfa',
    'Uşak',
    'Van',
    'Yozgat',
    'Zonguldak',
    'Aksaray',
    'Bayburt',
    'Karaman',
    'Kırıkkale',
    'Batman',
    'Şırnak',
    'Bartın',
    'Ardahan',
    'Iğdır',
    'Yalova',
    'Karabük',
    'Kilis',
    'Osmaniye',
    'Düzce'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cities.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(cities[index],style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            onTap: () {
              Navigator.of(context).pop(cities[index]);
            },
          );
        },
      ),
    );
  }
}
