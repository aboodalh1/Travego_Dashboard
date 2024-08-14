import 'package:flutter/material.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/widgets/flight_card.dart';

class FlightInfo extends StatelessWidget {
  const FlightInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Flight',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          FlightCard(
            departure: '20 Dec',
            returnDate: '21 Dec',
            departureTime: '9 AM',
            returnTime: '9 AM',
          ),
          FlightCard(
            departure: '22 Dec',
            returnDate: '25 Dec',
            departureTime: '10 AM',
            returnTime: '6 AM',
          ),
        ],
      ),
    );
  }
}
