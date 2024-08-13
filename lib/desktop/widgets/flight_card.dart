import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final String departure;
  final String returnDate;
  final String departureTime;
  final String returnTime;

  const FlightCard({
    super.key,
    required this.departure,
    required this.returnDate,
    required this.departureTime,
    required this.returnTime,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Leave: $departure',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Return: $returnDate',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Departure Time: $departureTime'),
                Text('Return Time: $returnTime'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
