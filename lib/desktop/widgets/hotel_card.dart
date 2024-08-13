import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/hotel_deatails.dart';

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;

  const HotelCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HotelDetailsPage(),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              location,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
