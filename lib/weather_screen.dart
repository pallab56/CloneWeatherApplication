import 'package:flutter/material.dart';
import 'package:rivaanranawaatweatherapp/additional_information_item_card.dart';
import 'package:rivaanranawaatweatherapp/hourly_forecast_item_card.dart';
import 'package:rivaanranawaatweatherapp/main_card.dart';
import 'package:http/http.dart' as http;
import 'package:rivaanranawaatweatherapp/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future getCurrentWeather() async {
    String cityName = 'London';
    final result = await http.get(
      /// Uri-->> Uniform Resource Identifier
      /// we can use either Uri.parse('') or Uri.https() both work
      /// URL -->> Uniform Resource Locator
      /// URL is subtype of URI

      /// have to put http:// before paste the url
      /// Break Down The Url api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=d307480bfedd81e6b13929accc7b55f7
      /// https:// ---- had to add
      /// api.openweathermap.org --> web Location
      /// /2.5 ----> their model
      /// AFter ? mark all this called as Queries
      /// q=London,uk&APPID=d307480bfedd81e6b13929accc7b55f7
      /// q=London,uk --> place Name want to get the weather off
      /// set the place name into a external variable
      /// String cityName = 'London'; outSIde the get function && inside of getCurrentWeather()
      /// APPID=d307480bfedd81e6b13929accc7b55f7 -->this is our AppId
      /// appId need to be stored in .env file which can be hidden by gitignore
      /// even when want to deploy your website assuming not want to deploy this website
      /// Bad practice
      /// creating another separate dart file called
      /// secret.dart and set appid like...
      /// const openWeatherAPIKey = 'd307480bfedd81e6b13929accc7b55f7';
      /// 
      
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName,uk&APPID=$openWeatherAPIKey',
      ),
    );

    print(result.body);
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                print('Refresh Icon Clicked');
              },
              child: const Icon(Icons.refresh_rounded),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// main card
            MainCard(),
            const SizedBox(height: 20),

            /// Weather Forecast card
            Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForeCastItemCard(
                    icon: Icons.cloud_rounded,
                    time: '06:00',
                    temperature: '456',
                  ),
                  HourlyForeCastItemCard(
                    icon: Icons.cloudy_snowing,
                    time: '06:00',
                    temperature: '456',
                  ),
                  HourlyForeCastItemCard(
                    icon: Icons.cloud_rounded,
                    time: '06:00',
                    temperature: '456',
                  ),
                  HourlyForeCastItemCard(
                    icon: Icons.cloud_rounded,
                    time: '06:00',
                    temperature: '456',
                  ),
                  HourlyForeCastItemCard(
                    icon: Icons.cloud_rounded,
                    time: '06:00',
                    temperature: '456',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            /// Additional card
            Text(
              "Additional Information",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformationItemCard(
                  icon: Icons.water_drop_rounded,
                  label: 'Humidity',
                  value: 94,
                ),
                AdditionalInformationItemCard(
                  icon: Icons.air_outlined,
                  label: 'Wind Speed',
                  value: 7.67,
                ),
                AdditionalInformationItemCard(
                  icon: Icons.beach_access_rounded,
                  label: 'Pressure',
                  value: 91,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
