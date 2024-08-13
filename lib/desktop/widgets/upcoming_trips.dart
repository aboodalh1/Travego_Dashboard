import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/widgets/trip_card.dart';

class UpcomingTrips extends StatelessWidget {
  const UpcomingTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Booking History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  TripCard(
                    destination: 'Mariana Lake',
                    startDate: '12 Dec',
                    description:
                        'Planning process are grouped into tours and put.',
                  ),
                  TripCard(
                    destination: 'Lotus Fallen',
                    startDate: '2 Jan',
                    description:
                        'Tour planning is a planning are grouped into tours and put.',
                  ),
                  TripCard(
                    destination: 'Mariana Lake',
                    startDate: '15 Feb',
                    description:
                        'Planning process are grouped into tours and put.',
                  ),
                  TripCard(
                    destination: 'Mariana Lake',
                    startDate: '12 Dec',
                    description:
                        'Planning process are grouped into tours and put.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
