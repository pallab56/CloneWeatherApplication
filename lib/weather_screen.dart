import 'dart:ui';

import 'package:flutter/material.dart';

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
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            const WeatherForeCastCard(),
            const SizedBox(height: 20),

            /// Additional card
            const Placeholder(fallbackHeight: 150),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class WeatherForeCastCard extends StatelessWidget {
  const WeatherForeCastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(5),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Column(
                children: [
                  Text(
                    '300.67° F',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  const Icon(
                    Icons.cloud_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Rain',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
