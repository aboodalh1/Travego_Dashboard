import 'package:flutter/material.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/placemodel.dart';

class AddEditPlace extends StatefulWidget {
  final Place? place;
  final Function(Place) onSave;

  const AddEditPlace({super.key, this.place, required this.onSave});

  @override
  _AddEditPlaceState createState() => _AddEditPlaceState();
}

class _AddEditPlaceState extends State<AddEditPlace> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _countryController;
  late TextEditingController _cityController;
  late TextEditingController _openingTimeController;
  late TextEditingController _closingTimeController;
  late TextEditingController _latitudeController;
  late TextEditingController _longitudeController;
  late TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.place?.name ?? '');
    _descriptionController =
        TextEditingController(text: widget.place?.description ?? '');
    _countryController =
        TextEditingController(text: widget.place?.country ?? '');
    _cityController = TextEditingController(text: widget.place?.city ?? '');
    _openingTimeController =
        TextEditingController(text: widget.place?.openingTime ?? '');
    _closingTimeController =
        TextEditingController(text: widget.place?.closingTime ?? '');
    _latitudeController = TextEditingController(
        text: widget.place?.location.latitude.toString() ?? '');
    _longitudeController = TextEditingController(
        text: widget.place?.location.longitude.toString() ?? '');
    _imageController = TextEditingController(text: widget.place?.image ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _openingTimeController.dispose();
    _closingTimeController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place == null ? 'Add Place' : 'Edit Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _countryController,
                decoration: const InputDecoration(labelText: 'Country'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the country';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _openingTimeController,
                decoration: const InputDecoration(labelText: 'Opening Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the opening time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _closingTimeController,
                decoration: const InputDecoration(labelText: 'Closing Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the closing time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _latitudeController,
                decoration: const InputDecoration(labelText: 'Latitude'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the latitude';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _longitudeController,
                decoration: const InputDecoration(labelText: 'Longitude'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the longitude';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'Image Path'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the image path';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final place = Place(
                      id: widget.place?.id ??
                          DateTime.now().millisecondsSinceEpoch,
                      name: _nameController.text,
                      description: _descriptionController.text,
                      country: _countryController.text,
                      city: _cityController.text,
                      openingTime: _openingTimeController.text,
                      closingTime: _closingTimeController.text,
                      location: Location(
                        id: widget.place?.location.id ??
                            DateTime.now().millisecondsSinceEpoch,
                        latitude: double.parse(_latitudeController.text),
                        longitude: double.parse(_longitudeController.text),
                      ),
                      image: _imageController.text,
                    );
                    widget.onSave(place);
                    Navigator.pop(context);
                  }
                },
                child:
                    Text(widget.place == null ? 'Add Place' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
