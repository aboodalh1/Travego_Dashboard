import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/travel.png')),
          SizedBox(height: 8),
          Text('Hosen R.', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Dhaka, Bangladesh'),
        ],
      ),
    );
  }
}
