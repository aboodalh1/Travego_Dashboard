import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddHotelPage extends StatefulWidget {
  const AddHotelPage({super.key});

  @override
  _AddHotelPageState createState() => _AddHotelPageState();
}

class _AddHotelPageState extends State<AddHotelPage> {
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
  final List<String> _photos = [];

  @override
  void initState() {
    super.initState();
    _hotelNameController = TextEditingController();
    _numOfRoomsController = TextEditingController();
    _starsController = TextEditingController();
    _cityNameController = TextEditingController();
    _countryController = TextEditingController();
    _descriptionController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
    _priceForExtraBedController = TextEditingController();
    _distanceFromCityController = TextEditingController();
    _breakfastPriceController = TextEditingController();
    _hotelServicesController = TextEditingController();
    _securityController = TextEditingController();
    _locationController = TextEditingController();
    _facilitiesController = TextEditingController();
    _cleanlinessController = TextEditingController();
    _averageRatingController = TextEditingController();
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
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Hotel'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildTextField(_hotelNameController, 'Hotel Name', Icons.hotel),
            buildTextField(_numOfRoomsController, 'Number of Rooms', Icons.meeting_room, isNumber: true),
            buildTextField(_starsController, 'Stars', Icons.star, isNumber: true),
            buildTextField(_cityNameController, 'City Name', Icons.location_city),
            buildTextField(_countryController, 'Country', Icons.public),
            buildTextField(_descriptionController, 'Description', Icons.description),
            buildTextField(_startTimeController, 'Start Time', Icons.access_time),
            buildTextField(_endTimeController, 'End Time', Icons.access_time),
            buildTextField(_priceForExtraBedController, 'Price for Extra Bed', Icons.attach_money, isNumber: true),
            buildTextField(_distanceFromCityController, 'Distance from City', Icons.directions, isNumber: true),
            buildTextField(_breakfastPriceController, 'Breakfast Price', Icons.breakfast_dining, isNumber: true),
            buildTextField(_hotelServicesController, 'Hotel Services', Icons.room_service),
            buildTextField(_securityController, 'Security', Icons.security),
            buildTextField(_locationController, 'Location', Icons.location_on),
            buildTextField(_facilitiesController, 'Facilities', Icons.local_parking),
            buildTextField(_cleanlinessController, 'Cleanliness', Icons.cleaning_services, isNumber: true),
            buildTextField(_averageRatingController, 'Average Rating', Icons.star_rate, isNumber: true),
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

  Widget buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
