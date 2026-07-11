

import 'dart:ui';

import 'package:flutter/material.dart';

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
                    '300.67K',
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
