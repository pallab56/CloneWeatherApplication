// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String currentSky;
  final String temp;
  const MainCard({super.key, required this.temp, required this.currentSky});

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
                    '$temp k',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                   currentSky=='Clouds'||currentSky =='Rain'? Icon(
                    Icons.cloud_rounded,
                    size: 64,
                    color: Colors.white,
                  ):Icon(
                    Icons.wb_sunny_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 15),
                   Text(
                    currentSky,
                    style:const TextStyle(
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
