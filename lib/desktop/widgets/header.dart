import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/places.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Welcome To Travego',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 400,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const place_page(),
                ),
              );
            },
            child: const Text('show more',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200))),
        // CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/travel.png')),
      ],
    );
  }
}
