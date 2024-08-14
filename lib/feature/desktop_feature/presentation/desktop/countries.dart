import 'package:flutter/material.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/addCountry.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryGridScreen extends StatefulWidget {
  const CountryGridScreen({super.key});

  @override
  _CountryGridScreenState createState() => _CountryGridScreenState();
}

class _CountryGridScreenState extends State<CountryGridScreen> {
  List<Country> countries = [
    Country(
      name: "France",
      imageUrl: "assets/images/download.jpeg",
      location: "Europe",
      cities: ["Paris", "Lyon", "Marseille"],
      googleMapsUrl: "https://www.google.com/maps/place/France",
    ),
    Country(
      name: "Italy",
      imageUrl: "assets/images/download (4).jpeg",
      location: "Europe",
      cities: ["Rome", "Milan", "Venice"],
      googleMapsUrl: "https://www.google.com/maps/place/Italy",
    ),
    Country(
      name: "Spain",
      imageUrl: "assets/images/download (3).jpeg",
      location: "Europe",
      cities: ["Madrid", "Barcelona", "Seville"],
      googleMapsUrl: "https://www.google.com/maps/place/Spain",
    ),
    Country(
      name: "Germany",
      imageUrl: "assets/images/images.jpeg",
      location: "Europe",
      cities: ["Berlin", "Munich", "Hamburg"],
      googleMapsUrl: "https://www.google.com/maps/place/Germany",
    ),
    Country(
      name: "Japan",
      imageUrl: "assets/images/images.jpeg",
      location: "Asia",
      cities: ["Tokyo", "Kyoto", "Osaka"],
      googleMapsUrl: "https://www.google.com/maps/place/Japan",
    ),
    Country(
      name: "Australia",
      imageUrl: "assets/images/images.jpeg",
      location: "Oceania",
      cities: ["Sydney", "Melbourne", "Brisbane"],
      googleMapsUrl: "https://www.google.com/maps/place/Australia",
    ),
    Country(
      name: "France",
      imageUrl: "assets/images/download.jpeg",
      location: "Europe",
      cities: ["Paris", "Lyon", "Marseille"],
      googleMapsUrl: "https://www.google.com/maps/place/France",
    ),
    Country(
      name: "Italy",
      imageUrl: "assets/images/download (4).jpeg",
      location: "Europe",
      cities: ["Rome", "Milan", "Venice"],
      googleMapsUrl: "https://www.google.com/maps/place/Italy",
    ),
    Country(
      name: "Spain",
      imageUrl: "assets/images/download (3).jpeg",
      location: "Europe",
      cities: ["Madrid", "Barcelona", "Seville"],
      googleMapsUrl: "https://www.google.com/maps/place/Spain",
    ),
    Country(
      name: "Germany",
      imageUrl: "assets/images/images.jpeg",
      location: "Europe",
      cities: ["Berlin", "Munich", "Hamburg"],
      googleMapsUrl: "https://www.google.com/maps/place/Germany",
    ),
    Country(
      name: "Japan",
      imageUrl: "assets/images/images.jpeg",
      location: "Asia",
      cities: ["Tokyo", "Kyoto", "Osaka"],
      googleMapsUrl: "https://www.google.com/maps/place/Japan",
    ),
    Country(
      name: "Australia",
      imageUrl: "assets/images/images.jpeg",
      location: "Oceania",
      cities: ["Sydney", "Melbourne", "Brisbane"],
      googleMapsUrl: "https://www.google.com/maps/place/Australia",
    ),
  ];

  void _editCountry(Country country) async {
    final editedCountry = await showDialog<Country>(
      context: context,
      builder: (BuildContext context) {
        return CountryEditDialog(country: country);
      },
    );

    if (editedCountry != null) {
      setState(() {
        int index = countries.indexOf(country);
        countries[index] = editedCountry;
      });
    }
  }

  void _deleteCountry(Country country) {
    setState(() {
      countries.remove(country);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourist Countries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_home),
            tooltip: 'Add New Country',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => const AddCountry(),
                  barrierDismissible: false);
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return CountryCard(
            country: country,
            onEdit: () => _editCountry(country),
            onDelete: () => _deleteCountry(country),
          );
        },
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CountryCard({
    super.key,
    required this.country,
    required this.onEdit,
    required this.onDelete,
  });

  void _openGoogleMaps(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showCities(BuildContext context, List<String> cities) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cities in ${country.name}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: cities.map((city) => Text(city)).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCities(context, country.cities),
      child: Card(
        elevation: 2,
        // color: Colors.amber,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                  country.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(4),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  country.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 5),
                Text(
                  country.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ]),
            ),
            const SizedBox(height: 3),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'View Cities',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 15,
                      icon: const Icon(Icons.edit),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      iconSize: 15,
                      icon: const Icon(Icons.delete),
                      onPressed: onDelete,
                    ),
                    IconButton(
                      iconSize: 15,
                      icon: const Icon(Icons.location_on),
                      onPressed: () => _openGoogleMaps(country.googleMapsUrl),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CountryEditDialog extends StatefulWidget {
  final Country country;

  const CountryEditDialog({super.key, required this.country});

  @override
  _CountryEditDialogState createState() => _CountryEditDialogState();
}

class _CountryEditDialogState extends State<CountryEditDialog> {
  late TextEditingController _nameController;
  late TextEditingController _imageUrlController;
  late TextEditingController _locationController;
  late TextEditingController _googleMapsUrlController;
  late TextEditingController _citiesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.country.name);
    _imageUrlController = TextEditingController(text: widget.country.imageUrl);
    _locationController = TextEditingController(text: widget.country.location);
    _googleMapsUrlController =
        TextEditingController(text: widget.country.googleMapsUrl);
    _citiesController =
        TextEditingController(text: widget.country.cities.join(", "));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageUrlController.dispose();
    _locationController.dispose();
    _googleMapsUrlController.dispose();
    _citiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Country'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _googleMapsUrlController,
              decoration: const InputDecoration(labelText: 'Google Maps URL'),
            ),
            TextField(
              controller: _citiesController,
              decoration:
                  const InputDecoration(labelText: 'Cities (comma separated)'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () {
            final editedCountry = Country(
              name: _nameController.text,
              imageUrl: _imageUrlController.text,
              location: _locationController.text,
              cities: _citiesController.text
                  .split(',')
                  .map((city) => city.trim())
                  .toList(),
              googleMapsUrl: _googleMapsUrlController.text,
            );
            Navigator.of(context).pop(editedCountry);
          },
        ),
      ],
    );
  }
}

class Country {
  final String name;
  final String imageUrl;
  final String location;
  final List<String> cities;
  final String googleMapsUrl;

  Country({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.cities,
    required this.googleMapsUrl,
  });
}
