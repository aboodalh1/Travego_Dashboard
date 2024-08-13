import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final String destination;
  final String startDate;
  final String description;

  const TripCard({
    super.key,
    required this.destination,
    required this.startDate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Start From: $startDate'),
            const SizedBox(height: 4),
            Text(description),
          ],
        ),
      ),
    );
  }
}
