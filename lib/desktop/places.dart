import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/addplace.dart';
import 'package:travego_dashboard/desktop/placemodel.dart';

import 'place_details.dart';


class place_page extends StatefulWidget {
  const place_page({super.key});

  @override
  _place_pageState createState() => _place_pageState();
}

class _place_pageState extends State<place_page> {
  List<Place> places = [
    Place(
      id: 1,
      name: "Alshoja3ia",
      description: "Freedom place",
      country: "Palestine",
      city: "Gaza",
      openingTime: "00:00:00",
      closingTime: "23:59:59",
      location: Location(
        id: 1,
        latitude: 31.500624389541155,
        longitude: 34.47062451333485,
      ),
      image: "assets/images/2.jpeg",
    ),
    Place(
      id: 2,
      name: "Alshoja3ia",
      description: "Freedom place",
      country: "Palestine",
      city: "Gaza",
      openingTime: "00:00:00",
      closingTime: "23:59:59",
      location: Location(
        id: 1,
        latitude: 31.500624389541155,
        longitude: 34.47062451333485,
      ),
      image: "assets/images/12 (1).jpeg",
    ),
    // أضف المزيد من الأماكن هنا
  ];

  void _addPlace(Place place) {
    setState(() {
      places.add(place);
    });
  }

  void _editPlace(Place place) {
    setState(() {
      final index = places.indexWhere((p) => p.id == place.id);
      if (index != -1) {
        places[index] = place;
      }
    });
  }

  void _navigateToAddEditPlace({Place? place}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditPlace(
          place: place,
          onSave: place == null ? _addPlace : _editPlace,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourist Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToAddEditPlace(),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1,
        ),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetails(place: place),
                ),
              );
            },
            onLongPress: () => _navigateToAddEditPlace(place: place),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      place.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
