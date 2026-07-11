import 'package:flutter/material.dart';

class AdditionalInformationItemCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final double value;
 const AdditionalInformationItemCard({super.key,
  required this.icon,required this.label,required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style:const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value.toString(),
            style:const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
