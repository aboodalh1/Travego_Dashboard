import 'package:flutter/material.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/placemodel.dart';

class PlaceDetails extends StatelessWidget {
  final Place? place;

  const PlaceDetails({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place!.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(place!.image),
            const SizedBox(height: 16),
            Text(
              place!.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              place!.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text("Country: ${place!.country}"),
            Text("City: ${place!.city}"),
            Text("Opening Time: ${place!.openingTime}"),
            Text("Closing Time: ${place!.closingTime}"),
            const SizedBox(height: 16),
            const Text(
              "Location:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Latitude: ${place!.location.latitude}"),
            Text("Longitude: ${place!.location.longitude}"),
          ],
        ),
      ),
    );
  }
}
