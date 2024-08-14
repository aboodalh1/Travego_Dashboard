import 'package:flutter/material.dart';

class HotelGridCard extends StatelessWidget {
  // final Hotel hotel;

  const HotelGridCard({
    super.key,
    required this.name,
    required this.location,
    required this.image,
  });
  final String name;
  final String location;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 248, 217, 122),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.network(
                image,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
