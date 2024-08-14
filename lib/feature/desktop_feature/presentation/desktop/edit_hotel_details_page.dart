import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditHotelDetailsPage extends StatefulWidget {
  final String hotelName;
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
  // final Function({
  //   required String newHotelName,
  //   required int newNumOfRooms,
  //   required int newStars,
  //   required String newCityName,
  //   required String newCountry,
  //   required String newDescription,
  //   required List<String> newPhotos,
  //   required String newStartTime,
  //   required String newEndTime,
  //   required double newPriceForExtraBed,
  //   required double newDistanceFromCity,
  //   required double newBreakfastPrice,
  //   required String newHotelServices,
  //   required String newSecurity,
  //   required String newLocation,
  //   required String newFacilities,
  //   required double newCleanliness,
  //   required double newAverageRating,
  // }) onSave;

  const EditHotelDetailsPage({
    super.key,
    required this.hotelName,
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
    // required this.onSave,
  });

  @override
  _EditHotelDetailsPageState createState() => _EditHotelDetailsPageState();
}

class _EditHotelDetailsPageState extends State<EditHotelDetailsPage> {
  late TextEditingController _hotelNameController;
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
    _starsController = TextEditingController(text: widget.stars.toString());
    _cityNameController = TextEditingController(text: widget.cityName);
    _countryController = TextEditingController(text: widget.country);
    _descriptionController = TextEditingController(text: widget.description);
    _startTimeController = TextEditingController(text: widget.startTime);
    _endTimeController = TextEditingController(text: widget.endTime);
    _priceForExtraBedController =
        TextEditingController(text: widget.priceForExtraBed.toString());
    _distanceFromCityController =
        TextEditingController(text: widget.distanceFromCity.toString());
    _breakfastPriceController =
        TextEditingController(text: widget.breakfastPrice.toString());
    _hotelServicesController =
        TextEditingController(text: widget.hotelServices);
    _securityController = TextEditingController(text: widget.security);
    _locationController = TextEditingController(text: widget.location);
    _facilitiesController = TextEditingController(text: widget.facilities);
    _cleanlinessController =
        TextEditingController(text: widget.cleanliness.toString());
    _averageRatingController =
        TextEditingController(text: widget.averageRating.toString());
    _photos = List.from(widget.photos);
  }

  @override
  void dispose() {
    _hotelNameController.dispose();
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
    // widget.onSave(
    //   newHotelName: _hotelNameController.text,
    //   newNumOfRooms: int.parse(_numOfRoomsController.text),
    //   newStars: int.parse(_starsController.text),
    //   newCityName: _cityNameController.text,
    //   newCountry: _countryController.text,
    //   newDescription: _descriptionController.text,
    //   newPhotos: _photos,
    //   newStartTime: _startTimeController.text,
    //   newEndTime: _endTimeController.text,
    //   newPriceForExtraBed: double.parse(_priceForExtraBedController.text),
    //   newDistanceFromCity: double.parse(_distanceFromCityController.text),
    //   newBreakfastPrice: double.parse(_breakfastPriceController.text),
    //   newHotelServices: _hotelServicesController.text,
    //   newSecurity: _securityController.text,
    //   newLocation: _locationController.text,
    //   newFacilities: _facilitiesController.text,
    //   newCleanliness: double.parse(_cleanlinessController.text),
    //   newAverageRating: double.parse(_averageRatingController.text),
    // );

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
            buildTextField(_starsController, 'Stars', isNumber: true),
            buildTextField(_cityNameController, 'City Name'),
            buildTextField(_countryController, 'Country'),
            buildTextField(_descriptionController, 'Description'),
            buildTextField(_startTimeController, 'Start Time'),
            buildTextField(_endTimeController, 'End Time'),
            buildTextField(_priceForExtraBedController, 'Price for Extra Bed',
                isNumber: true),
            buildTextField(_distanceFromCityController, 'Distance from City',
                isNumber: true),
            buildTextField(_breakfastPriceController, 'Breakfast Price',
                isNumber: true),
            buildTextField(_hotelServicesController, 'Hotel Services'),
            buildTextField(_securityController, 'Security'),
            buildTextField(_locationController, 'Location'),
            buildTextField(_facilitiesController, 'Facilities'),
            buildTextField(_cleanlinessController, 'Cleanliness',
                isNumber: true),
            buildTextField(_averageRatingController, 'Average Rating',
                isNumber: true),
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

  Widget buildTextField(TextEditingController controller, String label,
      {bool isNumber = false}) {
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
