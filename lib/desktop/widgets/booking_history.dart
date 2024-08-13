import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/widgets/booking_card.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Up Coming Trip',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  BookingCard(
                    destination: 'Star Pacific Ocean',
                    nights: 5,
                    location: 'USA, Miami',
                    date: '07-12-2022',
                    adjustments: 1,
                    price: 156,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Seagal Garden',
                    nights: 4,
                    location: 'India, Kolkata',
                    date: '09-12-2022',
                    adjustments: 3,
                    price: 200,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Pacify Valley',
                    nights: 8,
                    location: 'Nepal',
                    date: '10-12-2022',
                    adjustments: 5,
                    price: 180,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Inaya Garden',
                    nights: 6,
                    location: 'Nepal',
                    date: '03-12-2022',
                    adjustments: 1,
                    price: 236,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Star Pacific Ocean',
                    nights: 5,
                    location: 'USA, Miami',
                    date: '07-12-2022',
                    adjustments: 1,
                    price: 156,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Seagal Garden',
                    nights: 4,
                    location: 'India, Kolkata',
                    date: '09-12-2022',
                    adjustments: 3,
                    price: 200,
                    imagePath: 'assets/images/12 (1).jpeg',
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
