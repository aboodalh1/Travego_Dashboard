import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/countries.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.home),
            title: Text('Homepage'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.people),
            title: Text('User Tourist'),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.place_outlined),
          title: const Text('Our Destination'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CountryGridScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
