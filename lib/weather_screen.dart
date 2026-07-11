import 'package:flutter/material.dart';
import 'package:rivaanranawaatweatherapp/additional_information_item_card.dart';
import 'package:rivaanranawaatweatherapp/hourly_forecast_item_card.dart';
import 'package:rivaanranawaatweatherapp/main_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
