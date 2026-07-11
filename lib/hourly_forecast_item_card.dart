// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HourlyForeCastItemCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForeCastItemCard({
    Key? key,
    required this.time,
    required this.icon,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 145,
          width: 120,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  time,
                  style:const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
               const SizedBox(height: 8),
                Icon(icon, size: 32, color: Colors.white),
               const SizedBox(height: 8),
                Text(
                  temperature,
                  style:const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
