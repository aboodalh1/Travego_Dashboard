import 'package:flutter/material.dart';

class DestinationList extends StatelessWidget {
  const DestinationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('India'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('Thailand'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('Japan'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('China'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('Spain'),
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.more_horiz),
              title: Text('Show More'),
            ),
          ),
        ],
      ),
    );
  }
}
