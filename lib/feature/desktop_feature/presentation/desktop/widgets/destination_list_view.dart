import 'package:flutter/material.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/widgets/destination_card.dart';

class DestinationCards extends StatelessWidget {
  final List<DestinationCard> listplaces;
  DestinationCards({super.key, required this.listplaces});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listplaces.length,
        itemBuilder: (context, index) {
          return listplaces[index];
        },
      ),
    );
  }
}
