import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/edit_hotel_details_page.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/manager/hotel_details_cubit/hotel_details_cubit_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({super.key});

  @override
  _HotelDetailsPageState createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  //String hotelName = "Hotel Name";
  //int num_of_rooms = 50;
  //int stars = 5;
  //String cityName = "City";
  //String country = "Country";
  //String description = "A wonderful hotel with great amenities.";
  List<String> photos = [
    'assets/images/pngtree-hotel-room-that-has-a-window-overlooking-the-harbor-picture-image_2458677.jpg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ];
  // String startTime = "12:00 PM";
  // String endTime = "11:00 AM";
  // double priceForExtraBed = 20.0;
  // double distanceFromCity = 5.0;
  // double breakfastPrice = 15.0;
  // String hotelServices = "Free Wi-Fi, Pool, Gym";
  // String security = "24/7 Security";
  // String location = "123 Street, City";
  // String facilities = "Spa, Parking, Restaurant";
  // double cleanliness = 9.0;
  // double averageRating = 4.5;

  Future<void> _launchMapsUrl(String address) async {
    final query = Uri.encodeComponent(address);
    final url = 'https://www.google.com/maps/search/?api=1&query=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<HotelDetailsCubitCubit, HotelDetailsCubitState>(
        builder: (context, state) {
          if (state is HotelDetailsCubitSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 5,
                            child: Stack(
                              children: [
                                Image.asset(
                                  photos[0],
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: SizedBox(
                                    height: 70,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: photos.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(
                                              photos[index],
                                              width: 100,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Card(
                            elevation: 5,
                            child: ListView.builder(
                              itemCount: photos.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(photos[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          children: [
                            Text(
                              state.hotelDetailsModel.body!.hotel!.hotelName!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                                '${state.hotelDetailsModel.body!.hotel!.cityName}, ${state.hotelDetailsModel.body!.hotel!.country}',
                                style: const TextStyle(fontSize: 18)),
                            const SizedBox(height: 10),
                            const Divider(),
                            // buildDetailTile(Icons.meeting_room, 'Number of Rooms',
                            //     state.hotelDetailsModel.body..toString()),
                            buildStarRatingTile(
                                state.hotelDetailsModel.body!.hotel!.stars!),
                            buildDetailTile(
                                Icons.description,
                                'Description',
                                state.hotelDetailsModel.body!.hotel!
                                    .description!),
                            buildDetailTile(Icons.access_time, 'Start Time',
                                state.hotelDetailsModel.body!.startTime!),
                            buildDetailTile(Icons.access_time, 'End Time',
                                state.hotelDetailsModel.body!.endTime!),
                            buildDetailTile(
                                Icons.attach_money,
                                'Price for Extra Bed',
                                '\$${state.hotelDetailsModel.body!.priceForExtraBed}'),
                            buildDetailTile(
                                Icons.location_city,
                                'Distance from City',
                                '${state.hotelDetailsModel.body!.distanceFromCity} km'),
                            buildDetailTile(
                                Icons.free_breakfast,
                                'Breakfast Price',
                                '\$${state.hotelDetailsModel.body!.breakfastPrice}'),
                            buildDetailTile(
                                Icons.room_service,
                                'Hotel Services',
                                '${state.hotelDetailsModel.body!.hotelServices!.map((service) => service.name).join(', ')}'),
                            buildDetailTile(
                                Icons.security,
                                'Security',
                                state.hotelDetailsModel.body!.security!
                                    .toString()),
                            buildDetailTile(
                                Icons.location_on,
                                'Location',
                                state.hotelDetailsModel.body!.location
                                    .toString(),
                                onTap: () => _launchMapsUrl(state
                                    .hotelDetailsModel.body!.location
                                    .toString())),
                            buildDetailTile(
                                Icons.local_parking,
                                'Facilities',
                                state.hotelDetailsModel.body!.facilities
                                    .toString()),
                            buildDetailTile(
                                Icons.cleaning_services,
                                'Cleanliness',
                                state.hotelDetailsModel.body!.cleanliness
                                    .toString()),
                            buildDetailTile(
                                Icons.star_rate,
                                'Average Rating',
                                state.hotelDetailsModel.body!.averageRating
                                    .toString()),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditHotelDetailsPage(
                                          hotelName: state.hotelDetailsModel
                                              .body!.hotel!.hotelName!,
                                          stars: state.hotelDetailsModel.body!
                                              .hotel!.stars!,
                                          cityName: state.hotelDetailsModel
                                              .body!.hotel!.cityName!,
                                          country: state.hotelDetailsModel.body!
                                              .hotel!.country!,
                                          description: state.hotelDetailsModel
                                              .body!.hotel!.description!,
                                          photos: photos,
                                          startTime: state.hotelDetailsModel
                                              .body!.startTime!,
                                          endTime: state
                                              .hotelDetailsModel.body!.endTime!,
                                          priceForExtraBed: state
                                              .hotelDetailsModel
                                              .body!
                                              .priceForExtraBed!
                                              .toDouble(),
                                          distanceFromCity: state
                                              .hotelDetailsModel
                                              .body!
                                              .distanceFromCity!
                                              .toDouble(),
                                          breakfastPrice: state
                                              .hotelDetailsModel
                                              .body!
                                              .breakfastPrice!
                                              .toDouble(),
                                          hotelServices: state.hotelDetailsModel
                                              .body!.hotelServices!
                                              .map((service) => service.name)
                                              .join(', '),
                                          security: state
                                              .hotelDetailsModel.body!.security!
                                              .toString(),
                                          location: state
                                              .hotelDetailsModel.body!.location
                                              .toString(),
                                          facilities: state.hotelDetailsModel
                                              .body!.facilities
                                              .toString(),
                                          cleanliness: state.hotelDetailsModel
                                              .body!.cleanliness!
                                              .toDouble(),
                                          averageRating: state.hotelDetailsModel
                                              .body!.averageRating!
                                              .toDouble(),
                                          // onSave: updateHotelDetails,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                  ),
                                  child: const Text('Edit Details'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // حذف الفندق
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  child: const Text('Delete Hotel'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is HotelDetailsCubitLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HotelDetailsCubitFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return Center(
              child: Text('There is an error'),
            );
          }
        },
      ),
    );
  }

  Widget buildDetailTile(IconData icon, String title, String subtitle,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  Widget buildStarRatingTile(int stars) {
    return ListTile(
      leading: const Icon(Icons.star, color: Colors.blueAccent),
      title: const Text('Stars'),
      subtitle: Row(
        children: List.generate(
            stars, (index) => const Icon(Icons.star, color: Colors.yellow)),
      ),
    );
  }
}
