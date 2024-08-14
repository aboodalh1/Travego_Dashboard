import 'package:flutter/material.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/add_hotel.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/widgets/hotels_grid_view.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add New Hotel',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => const AddHotelPage(),
                  barrierDismissible: false);
            },
          ),
        ],
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Hotels',
          style: TextStyle(
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: HotelsGridView(),
    );
  }
}
