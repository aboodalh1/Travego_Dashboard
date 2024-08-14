import 'package:flutter/material.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/widgets/hotel_card.dart';

class HotelCards extends StatelessWidget {
  const HotelCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          HotelCard(
            imagePath: 'assets/images/lovepik-man-travel.png',
            title: 'Nepal Mountain',
            location: 'Nepal, Kathmandu',
          ),
          HotelCard(
            imagePath: 'assets/images/addcom.png',
            title: 'USA Sea Beach',
            location: 'USA, Miami',
          ),
          HotelCard(
            imagePath: 'assets/images/travel.png',
            title: 'India Jhansi',
            location: 'India, Kolkata',
          ),
          HotelCard(
            imagePath: 'assets/images/addcom.png',
            title: 'Nepal Mountain',
            location: 'Nepal, Kathmandu',
          ),
          HotelCard(
            imagePath: 'assets/images/traveling.png',
            title: 'USA Sea Beach',
            location: 'USA, Miami',
          ),
          HotelCard(
            imagePath: 'assets/images/travel.png',
            title: 'India Jhansi',
            location: 'India, Kolkata',
          ),
          // يمكنك إضافة المزيد من البطاقات هنا
        ],
      ),
    );
  }
}
