import 'dart:convert';

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
  // late double temp = 0;

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

  Future<Map<String, dynamic>> getCurrentWeather() async {
    String cityName = 'London';
    try {
      final result = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$openWeatherAPIKey',
        ),
      );

      final data = jsonDecode(result.body);
      if (data['cod'] != '200') {
        throw 'An Unexpected Error Occurerd';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
    // temp = data['list'][0]["main"]["temp"];
    //   try {

    //     setState(() {
    //       temp = data['list'][0]["main"]["temp"];
    //     });
    //   } catch (e) {
    //     throw e.toString();
    //   }
    // }

    // @override
    // void initState() {
    //   super.initState();

    //   getCurrentWeather();
    // }
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
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];

          // main card data
          final currentTemp = currentWeatherData["main"]["temp"];
          final currentSky = currentWeatherData['weather'][0]['main'];
          // additional information data
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];
          // Hourly ForeCast Data
          final int weatherDatalength = data['list'].length;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// main card
                MainCard(temp: currentTemp.toString(), currentSky: currentSky),
                const SizedBox(height: 20),

                /// Weather Forecast card
                Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ),

                /// using loop to create 40 items together it's heavy work
                /// can affect the performance of app it's insane
                //Using Loop
                // for(var i=0;i<=12;i++)
                //    Padding(
                //      padding: const EdgeInsets.all(0.0),
                //      child: HourlyForeCastItemCard(
                //       time: data['list'][i+1]['dt'].toString(),
                //       icon: data['list'][i+1]['weather'][0]['main']=='Clouds'||
                //       data['list'][i+1]['weather'][0]['main']=='Rain'
                //       ?Icons.cloud
                //       :Icons.sunny,
                //       temperature: data['list'][i+1]['main']['temp'].toString(),
                //                            ),
                //    ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, index) {
                      final hourlyForeCast = data['list'][index + 1];
                      final hourlySky = hourlyForeCast['weather'][0]['main'];
                      final hourlyTemp = hourlyForeCast['main']['temp']
                          .toString();
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: HourlyForeCastItemCard(
                          time: hourlyForeCast['dt_txt'].toString(),
                          icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                              ? Icons.cloud
                              : Icons.sunny,
                          temperature: hourlyTemp,
                        ),
                      );
                    },
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
                      value: currentHumidity.toString(),
                    ),
                    AdditionalInformationItemCard(
                      icon: Icons.air_outlined,
                      label: 'Wind Speed',
                      value: currentWindSpeed.toString(),
                    ),
                    AdditionalInformationItemCard(
                      icon: Icons.beach_access_rounded,
                      label: 'Pressure',
                      value: currentPressure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
