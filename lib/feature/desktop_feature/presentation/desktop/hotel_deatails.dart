import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({super.key});

  @override
  _HotelDetailsPageState createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  
  String hotelName = "Hotel Name";
  int num_of_rooms = 50;
  int stars = 5;
  String cityName = "City";
  String country = "Country";
  String description = "A wonderful hotel with great amenities.";
  List<String> photos = [
    'assets/images/pngtree-hotel-room-that-has-a-window-overlooking-the-harbor-picture-image_2458677.jpg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ];
  String startTime = "12:00 PM";
  String endTime = "11:00 AM";
  double priceForExtraBed = 20.0;
  double distanceFromCity = 5.0;
  double breakfastPrice = 15.0;
  String hotelServices = "Free Wi-Fi, Pool, Gym";
  String security = "24/7 Security";
  String location = "123 Street, City";
  String facilities = "Spa, Parking, Restaurant";
  double cleanliness = 9.0;
  double averageRating = 4.5;

  void updateHotelDetails({
    required String newHotelName,
    required int newNumOfRooms,
    required int newStars,
    required String newCityName,
    required String newCountry,
    required String newDescription,
    required List<String> newPhotos,
    required String newStartTime,
    required String newEndTime,
    required double newPriceForExtraBed,
    required double newDistanceFromCity,
    required double newBreakfastPrice,
    required String newHotelServices,
    required String newSecurity,
    required String newLocation,
    required String newFacilities,
    required double newCleanliness,
    required double newAverageRating,
  }) {
    setState(() {
      hotelName = newHotelName;
      num_of_rooms = newNumOfRooms;
      stars = newStars;
      cityName = newCityName;
      country = newCountry;
      description = newDescription;
      photos = newPhotos;
      startTime = newStartTime;
      endTime = newEndTime;
      priceForExtraBed = newPriceForExtraBed;
      distanceFromCity = newDistanceFromCity;
      breakfastPrice = newBreakfastPrice;
      hotelServices = newHotelServices;
      security = newSecurity;
      location = newLocation;
      facilities = newFacilities;
      cleanliness = newCleanliness;
      averageRating = newAverageRating;
    });
  }

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
    final hotel = ModalRoute.of(context)?.settings.arguments;
     return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
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
                                      borderRadius: BorderRadius.circular(10.0),
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
                       hotelName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('$cityName, $country', style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      const Divider(),
                      buildDetailTile(Icons.meeting_room, 'Number of Rooms', num_of_rooms.toString()),
                      buildStarRatingTile(stars),
                      buildDetailTile(Icons.description, 'Description', description),
                      buildDetailTile(Icons.access_time, 'Start Time', startTime),
                      buildDetailTile(Icons.access_time, 'End Time', endTime),
                      buildDetailTile(Icons.attach_money, 'Price for Extra Bed', '\$$priceForExtraBed'),
                      buildDetailTile(Icons.location_city, 'Distance from City', '$distanceFromCity km'),
                      buildDetailTile(Icons.free_breakfast, 'Breakfast Price', '\$$breakfastPrice'),
                      buildDetailTile(Icons.room_service, 'Hotel Services', hotelServices),
                      buildDetailTile(Icons.security, 'Security', security),
                      buildDetailTile(Icons.location_on, 'Location', location, onTap: () => _launchMapsUrl(location)),
                      buildDetailTile(Icons.local_parking, 'Facilities', facilities),
                      buildDetailTile(Icons.cleaning_services, 'Cleanliness', cleanliness.toString()),
                      buildDetailTile(Icons.star_rate, 'Average Rating', averageRating.toString()),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditHotelDetailsPage(
                                    hotelName: hotelName,
                                    num_of_rooms: num_of_rooms,
                                    stars: stars,
                                    cityName: cityName,
                                    country: country,
                                    description: description,
                                    photos: photos,
                                    startTime: startTime,
                                    endTime: endTime,
                                    priceForExtraBed: priceForExtraBed,
                                    distanceFromCity: distanceFromCity,
                                    breakfastPrice: breakfastPrice,
                                    hotelServices: hotelServices,
                                    security: security,
                                    location: location,
                                    facilities: facilities,
                                    cleanliness: cleanliness,
                                    averageRating: averageRating,
                                    onSave: updateHotelDetails,
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
      ),
    );
  }

  Widget buildDetailTile(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
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
        children: List.generate(stars, (index) => const Icon(Icons.star, color: Colors.yellow)),
      ),
    );
  }
}

class EditHotelDetailsPage extends StatefulWidget {
  final String hotelName;
  final int num_of_rooms;
  final int stars;
  final String cityName;
  final String country;
  final String description;
  final List<String> photos;
  final String startTime;
  final String endTime;
  final double priceForExtraBed;
  final double distanceFromCity;
  final double breakfastPrice;
  final String hotelServices;
  final String security;
  final String location;
  final String facilities;
  final double cleanliness;
  final double averageRating;
  final Function({
    required String newHotelName,
    required int newNumOfRooms,
    required int newStars,
    required String newCityName,
    required String newCountry,
    required String newDescription,
    required List<String> newPhotos,
    required String newStartTime,
    required String newEndTime,
    required double newPriceForExtraBed,
    required double newDistanceFromCity,
    required double newBreakfastPrice,
    required String newHotelServices,
    required String newSecurity,
    required String newLocation,
    required String newFacilities,
    required double newCleanliness,
    required double newAverageRating,
  }) onSave;

  const EditHotelDetailsPage({super.key, 
    required this.hotelName,
    required this.num_of_rooms,
    required this.stars,
    required this.cityName,
    required this.country,
    required this.description,
    required this.photos,
    required this.startTime,
    required this.endTime,
    required this.priceForExtraBed,
    required this.distanceFromCity,
    required this.breakfastPrice,
    required this.hotelServices,
    required this.security,
    required this.location,
    required this.facilities,
    required this.cleanliness,
    required this.averageRating,
    required this.onSave,
  });

  @override
  _EditHotelDetailsPageState createState() => _EditHotelDetailsPageState();
}

class _EditHotelDetailsPageState extends State<EditHotelDetailsPage> {
  late TextEditingController _hotelNameController;
  late TextEditingController _numOfRoomsController;
  late TextEditingController _starsController;
  late TextEditingController _cityNameController;
  late TextEditingController _countryController;
  late TextEditingController _descriptionController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _priceForExtraBedController;
  late TextEditingController _distanceFromCityController;
  late TextEditingController _breakfastPriceController;
  late TextEditingController _hotelServicesController;
  late TextEditingController _securityController;
  late TextEditingController _locationController;
  late TextEditingController _facilitiesController;
  late TextEditingController _cleanlinessController;
  late TextEditingController _averageRatingController;
  List<String> _photos = [];

  @override
  void initState() {
    super.initState();
    _hotelNameController = TextEditingController(text: widget.hotelName);
    _numOfRoomsController = TextEditingController(text: widget.num_of_rooms.toString());
    _starsController = TextEditingController(text: widget.stars.toString());
    _cityNameController = TextEditingController(text: widget.cityName);
    _countryController = TextEditingController(text: widget.country);
    _descriptionController = TextEditingController(text: widget.description);
    _startTimeController = TextEditingController(text: widget.startTime);
    _endTimeController = TextEditingController(text: widget.endTime);
    _priceForExtraBedController = TextEditingController(text: widget.priceForExtraBed.toString());
    _distanceFromCityController = TextEditingController(text: widget.distanceFromCity.toString());
    _breakfastPriceController = TextEditingController(text: widget.breakfastPrice.toString());
    _hotelServicesController = TextEditingController(text: widget.hotelServices);
    _securityController = TextEditingController(text: widget.security);
    _locationController = TextEditingController(text: widget.location);
    _facilitiesController = TextEditingController(text: widget.facilities);
    _cleanlinessController = TextEditingController(text: widget.cleanliness.toString());
    _averageRatingController = TextEditingController(text: widget.averageRating.toString());
    _photos = List.from(widget.photos);
  }

  @override
  void dispose() {
    _hotelNameController.dispose();
    _numOfRoomsController.dispose();
    _starsController.dispose();
    _cityNameController.dispose();
    _countryController.dispose();
    _descriptionController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _priceForExtraBedController.dispose();
    _distanceFromCityController.dispose();
    _breakfastPriceController.dispose();
    _hotelServicesController.dispose();
    _securityController.dispose();
    _locationController.dispose();
    _facilitiesController.dispose();
    _cleanlinessController.dispose();
    _averageRatingController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _photos.add(image.path);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _photos.removeAt(index);
    });
  }

  void _saveDetails() {
    widget.onSave(
      newHotelName: _hotelNameController.text,
      newNumOfRooms: int.parse(_numOfRoomsController.text),
      newStars: int.parse(_starsController.text),
      newCityName: _cityNameController.text,
      newCountry: _countryController.text,
      newDescription: _descriptionController.text,
      newPhotos: _photos,
      newStartTime: _startTimeController.text,
      newEndTime: _endTimeController.text,
      newPriceForExtraBed: double.parse(_priceForExtraBedController.text),
      newDistanceFromCity: double.parse(_distanceFromCityController.text),
      newBreakfastPrice: double.parse(_breakfastPriceController.text),
      newHotelServices: _hotelServicesController.text,
      newSecurity: _securityController.text,
      newLocation: _locationController.text,
      newFacilities: _facilitiesController.text,
      newCleanliness: double.parse(_cleanlinessController.text),
      newAverageRating: double.parse(_averageRatingController.text),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Hotel Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildTextField(_hotelNameController, 'Hotel Name'),
            buildTextField(_numOfRoomsController, 'Number of Rooms', isNumber: true),
            buildTextField(_starsController, 'Stars', isNumber: true),
            buildTextField(_cityNameController, 'City Name'),
            buildTextField(_countryController, 'Country'),
            buildTextField(_descriptionController, 'Description'),
            buildTextField(_startTimeController, 'Start Time'),
            buildTextField(_endTimeController, 'End Time'),
            buildTextField(_priceForExtraBedController, 'Price for Extra Bed', isNumber: true),
            buildTextField(_distanceFromCityController, 'Distance from City', isNumber: true),
            buildTextField(_breakfastPriceController, 'Breakfast Price', isNumber: true),
            buildTextField(_hotelServicesController, 'Hotel Services'),
            buildTextField(_securityController, 'Security'),
            buildTextField(_locationController, 'Location'),
            buildTextField(_facilitiesController, 'Facilities'),
            buildTextField(_cleanlinessController, 'Cleanliness', isNumber: true),
            buildTextField(_averageRatingController, 'Average Rating', isNumber: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Add Image'),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: _photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.network(
                      (_photos[index]),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
                        child: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}



















// class HotelDetailsPage extends StatefulWidget {
//   @override
//   _HotelDetailsPageState createState() => _HotelDetailsPageState();
// }

// class _HotelDetailsPageState extends State<HotelDetailsPage> {
//   Map<String, dynamic> hotelDetails = {
//     'hotelName': 'Luxury Suite',
//     'num_of_rooms': 45,
//     'stars': 5,
//     'cityName': 'Paris',
//     'country': 'France',
//     'description': 'A luxurious suite in the heart of Paris with a beautiful sea view and sunlight in the mornings.',
//     'photos': ['assets/images/download (1).jpeg', 'assets/images/images.jpeg'],
//     'startTime': '12:00 PM',
//     'endTime': '11:00 AM',
//     'priceForExtraBed': 50,
//     'distanceFromCity': '2 km',
//     'breakfastPrice': 20,
//     'hotelServices': ['Shower', 'Concierge', 'Safe', '24/7 service', 'Luggage'],
//     'security': '24/7 security',
//     'location': '123 Paris St, Paris, France',
//     'facilities': ['Spa', 'Gym', 'Pool'],
//     'cleanliness': 4.5,
//     'averageRating': 4.8,
//   };

//   void _editHotelDetails() async {
//     final updatedDetails = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditHotelDetailsPage(hotelDetails: hotelDetails),
//       ),
//     );

//     if (updatedDetails != null) {
//       setState(() {
//         hotelDetails = updatedDetails;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(hotelDetails['hotelName']),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: _editHotelDetails,
//           ),
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//               // Handle delete hotel
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
                
//                 width: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.0),
//                   image: DecorationImage(
//                     image: AssetImage(hotelDetails['photos'][1]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 height: 200.0,

//               ),
//               SizedBox(height: 16),
//               Text(
//                 '${hotelDetails['hotelName']}',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 '${hotelDetails['cityName']}, ${hotelDetails['country']}',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//               SizedBox(height: 16),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Room Amenities',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Shower, Concierge, Safe, 24/7 service, Luggage',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Bed Type',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Queen Size Bed Comfy for 2 people able to spread out',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Cancellation Rules',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Free Cancellation until 22 July. After 26 July 23:59 No Refund',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Booking Options',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'booking.com',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             Text(
//                               'USD 964/3 Nights',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'HotelStore',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             Text(
//                               'USD 872/3 Nights',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text('Choose'),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                             textStyle: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class EditHotelDetailsPage extends StatefulWidget {
//   final Map<String, dynamic> hotelDetails;

//   EditHotelDetailsPage({required this.hotelDetails});

//   @override
//   _EditHotelDetailsPageState createState() => _EditHotelDetailsPageState();
// }

// class _EditHotelDetailsPageState extends State<EditHotelDetailsPage> {
//   late TextEditingController _nameController;
//   late TextEditingController _numOfRoomsController;
//   late TextEditingController _starsController;
//   late TextEditingController _cityController;
//   late TextEditingController _countryController;
//   late TextEditingController _descriptionController;
//   late TextEditingController _startTimeController;
//   late TextEditingController _endTimeController;
//   late TextEditingController _priceForExtraBedController;
//   late TextEditingController _distanceFromCityController;
//   late TextEditingController _breakfastPriceController;
//   late TextEditingController _securityController;
//   late TextEditingController _locationController;
//   late TextEditingController _cleanlinessController;
//   late TextEditingController _averageRatingController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.hotelDetails['hotelName']);
//     _numOfRoomsController = TextEditingController(text: widget.hotelDetails['num_of_rooms'].toString());
//     _starsController = TextEditingController(text: widget.hotelDetails['stars'].toString());
//     _cityController = TextEditingController(text: widget.hotelDetails['cityName']);
//     _countryController = TextEditingController(text: widget.hotelDetails['country']);
//     _descriptionController = TextEditingController(text: widget.hotelDetails['description']);
//     _startTimeController = TextEditingController(text: widget.hotelDetails['startTime']);
//     _endTimeController = TextEditingController(text: widget.hotelDetails['endTime']);
//     _priceForExtraBedController = TextEditingController(text: widget.hotelDetails['priceForExtraBed'].toString());
//     _distanceFromCityController = TextEditingController(text: widget.hotelDetails['distanceFromCity']);
//     _breakfastPriceController = TextEditingController(text: widget.hotelDetails['breakfastPrice'].toString());
//     _securityController = TextEditingController(text: widget.hotelDetails['security']);
//     _locationController = TextEditingController(text: widget.hotelDetails['location']);
//     _cleanlinessController = TextEditingController(text: widget.hotelDetails['cleanliness'].toString());
//     _averageRatingController = TextEditingController(text: widget.hotelDetails['averageRating'].toString());
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _numOfRoomsController.dispose();
//     _starsController.dispose();
//     _cityController.dispose();
//     _countryController.dispose();
//     _descriptionController.dispose();
//     _startTimeController.dispose();
//     _endTimeController.dispose();
//     _priceForExtraBedController.dispose();
//     _distanceFromCityController.dispose();
//     _breakfastPriceController.dispose();
//     _securityController.dispose();
//     _locationController.dispose();
//     _cleanlinessController.dispose();
//     _averageRatingController.dispose();
//     super.dispose();
//   }

//   void _saveDetails() {
//     final updatedDetails = {
//       'hotelName': _nameController.text,
//       'num_of_rooms': int.tryParse(_numOfRoomsController.text) ?? 0,
//       'stars': int.tryParse(_starsController.text) ?? 0,
//       'cityName': _cityController.text,
//       'country': _countryController.text,
//       'description': _descriptionController.text,
//       'photos': widget.hotelDetails['photos'], // Keeping the same photos for simplicity
//       'startTime': _startTimeController.text,
//       'endTime': _endTimeController.text,
//       'priceForExtraBed': int.tryParse(_priceForExtraBedController.text) ?? 0,
//       'distanceFromCity': _distanceFromCityController.text,
//       'breakfastPrice': int.tryParse(_breakfastPriceController.text) ?? 0,
//       'hotelServices': widget.hotelDetails['hotelServices'], // Services remain the same
//       'security': _securityController.text,
//       'location': _locationController.text,
//       'facilities': widget.hotelDetails['facilities'], // Facilities remain the same
//       'cleanliness': double.tryParse(_cleanlinessController.text) ?? 0.0,
//       'averageRating': double.tryParse(_averageRatingController.text) ?? 0.0,
//     };

//     Navigator.pop(context, updatedDetails);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Hotel Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Hotel Name'),
//               ),
//               TextField(
//                 controller: _numOfRoomsController,
//                 decoration: InputDecoration(labelText: 'Number of Rooms'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _starsController,
//                 decoration: InputDecoration(labelText: 'Stars'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _cityController,
//                 decoration: InputDecoration(labelText: 'City'),
//               ),
//               TextField(
//                 controller: _countryController,
//                 decoration: InputDecoration(labelText: 'Country'),
//               ),
//               TextField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//               TextField(
//                 controller: _startTimeController,
//                 decoration: InputDecoration(labelText: 'Start Time'),
//               ),
//               TextField(
//                 controller: _endTimeController,
//                 decoration: InputDecoration(labelText: 'End Time'),
//               ),
//               TextField(
//                 controller: _priceForExtraBedController,
//                 decoration: InputDecoration(labelText: 'Price for Extra Bed'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _distanceFromCityController,
//                 decoration: InputDecoration(labelText: 'Distance from City'),
//               ),
//               TextField(
//                 controller: _breakfastPriceController,
//                 decoration: InputDecoration(labelText: 'Breakfast Price'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _securityController,
//                 decoration: InputDecoration(labelText: 'Security'),
//               ),
//               TextField(
//                 controller: _locationController,
//                 decoration: InputDecoration(labelText: 'Location'),
//               ),
//               TextField(
//                 controller: _cleanlinessController,
//                 decoration: InputDecoration(labelText: 'Cleanliness'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _averageRatingController,
//                 decoration: InputDecoration(labelText: 'Average Rating'),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _saveDetails,
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//  'assets/images/download (1).jpeg',
//     'assets/images/download (1).jpeg',
//     'assets/images/download (1).jpeg',
//     'assets/images/download (2).jpeg',
//     'assets/images/download (2).jpeg',
//     'assets/images/download (2).jpeg',
//     'assets/images/download (2).jpeg',