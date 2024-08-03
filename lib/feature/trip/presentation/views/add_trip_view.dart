import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travego_dashboard/feature/trip/data/models/country_model.dart';
import 'package:travego_dashboard/feature/trip/presentation/manager/country_cubit/country_cubit.dart';

class AddTripView extends StatefulWidget {
  const AddTripView({super.key});

  @override
  State<AddTripView> createState() => _AddTripViewState();
}

class _AddTripViewState extends State<AddTripView> {
  final TextEditingController tripNameController = TextEditingController();
  final TextEditingController tripDescriptionController = TextEditingController();
  final TextEditingController hotelPriceController = TextEditingController();
  final TextEditingController flightPriceController = TextEditingController();
  final TextEditingController servicesPriceController = TextEditingController();

  DateTime? tripStartDate;
  DateTime? tripEndDate;
  CountryModel? selectedCountry;
  List<int> selectedCities = [];
  List<int> selectedHotels = [];
  int minPassengers = 0;
  int maxPassengers = 0;
  String? tripCategory;
  String? tripStatus;
  bool isPrivate = true;
  String? selectedFlightCompany;

  late CountryCubit manager;

  void onTripNameChange(String value) {
    setState(() {});
  }

  void onTripDescriptionChange(String value) {
    setState(() {});
  }

  void onHotelPriceChange(String value) {
    setState(() {});
  }

  void onFlightPriceChange(String value) {
    setState(() {});
  }

  void onServicesPriceChange(String value) {
    setState(() {});
  }

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        tripStartDate = picked;
      });
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        tripEndDate = picked;
      });
    }
  }

  void onCountryChange(CountryModel value) {
    setState(() {
      selectedCountry = value;
    });
  }

  void onCityChange(int value) {
    setState(() {
      if (!selectedCities.contains(value)) {
        selectedCities.add(value);
      }
    });
  }

  void onHotelChange(int value) {
    setState(() {
      if (!selectedHotels.contains(value)) {
        selectedHotels.add(value);
      }
    });
  }

  void onMinPassengersChange(int value) {
    setState(() {
      minPassengers = value;
    });
  }

  void onMaxPassengersChange(int value) {
    setState(() {
      maxPassengers = value;
    });
  }

  void onTripCategoryChange(String? value) {
    setState(() {
      tripCategory = value;
    });
  }

  void onTripStatusChange(String? value) {
    setState(() {
      tripStatus = value;
    });
  }

  void onPrivacyChange(bool value) {
    setState(() {
      isPrivate = value;
    });
  }

  void onFlightCompanyChange(String value) {
    setState(() {
      selectedFlightCompany = value;
    });
  }

  void onSubmit() {
    if (tripNameController.text.isEmpty) {
      showAlert('Trip Name is required');
      return;
    }

    if (tripDescriptionController.text.isEmpty) {
      showAlert('Trip Description is required');
      return;
    }

    if (tripStartDate == null) {
      showAlert('Trip Start Date is required');
      return;
    }

    if (tripEndDate == null) {
      showAlert('Trip End Date is required');
      return;
    }

    if (selectedCountry == null) {
      showAlert('Country selection is required');
      return;
    }

    if (selectedCities.isEmpty) {
      showAlert('At least one city must be selected');
      return;
    }

    if (selectedHotels.isEmpty) {
      showAlert('At least one hotel must be selected');
      return;
    }

    if (tripCategory == null) {
      showAlert('Trip Category selection is required');
      return;
    }

    if (tripStatus == null) {
      showAlert('Trip Status selection is required');
      return;
    }

    if (hotelPriceController.text.isEmpty || double.tryParse(hotelPriceController.text) == null) {
      showAlert('Valid Hotel Price is required');
      return;
    }

    if (flightPriceController.text.isEmpty || double.tryParse(flightPriceController.text) == null) {
      showAlert('Valid Flight Price is required');
      return;
    }

    if (servicesPriceController.text.isEmpty || double.tryParse(servicesPriceController.text) == null) {
      showAlert('Valid Services Price is required');
      return;
    }

    if (selectedFlightCompany == null) {
      showAlert('Flight Company selection is required');
      return;
    }

    // Handle form submission
    print('Form submitted');
  }

  void showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Validation Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
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
  void dispose() {
    tripNameController.dispose();
    tripDescriptionController.dispose();
    hotelPriceController.dispose();
    flightPriceController.dispose();
    servicesPriceController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    manager=context.read<CountryCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    manager.fetchAllCountries();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tripNameController,
              decoration: const InputDecoration(labelText: 'Trip Name'),
              onChanged: onTripNameChange,
            ),
            TextField(
              controller: tripDescriptionController,
              decoration: const InputDecoration(labelText: 'Trip Description'),
              onChanged: onTripDescriptionChange,
            ),
            PopupMenuButton<String>(
              child: Text(selectedFlightCompany ?? 'Select Flight Company'),
              onSelected: onFlightCompanyChange,
              itemBuilder: (BuildContext context) {
                return ['Company1', 'Company2', 'Company3'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Text(tripStartDate != null
                      ? tripStartDate.toString()
                      : 'Select Start Date'),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => selectStartDate(context),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(tripEndDate != null
                      ? tripEndDate.toString()
                      : 'Select End Date'),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => selectEndDate(context),
                ),
              ],
            ),
            PopupMenuButton<CountryModel>(
              child: Text(selectedCountry!=null?'${selectedCountry!.name}' : 'Select Country'),
              onSelected: onCountryChange,
              itemBuilder: (BuildContext context) {
                return manager.countries.map(( choice) {
                  return PopupMenuItem<CountryModel>(
                    value: choice,
                    child: Text(choice.name),
                  );
                }).toList();
              },
            ),
            PopupMenuButton<int>(
              child: const Text('Select Cities'),
              onSelected: onCityChange,
              itemBuilder: (BuildContext context) {
                return List<PopupMenuEntry<int>>.generate(
                  10,
                      (int index) => PopupMenuItem<int>(
                    value: index,
                    child: Text('City $index'),
                  ),
                );
              },
            ),
            PopupMenuButton<int>(
              child: const Text('Select Hotels'),
              onSelected: onHotelChange,
              itemBuilder: (BuildContext context) {
                return List<PopupMenuEntry<int>>.generate(
                  10,
                      (int index) => PopupMenuItem<int>(
                    value: index,
                    child: Text('Hotel $index'),
                  ),
                );
              },
            ),
            Row(
              children: [
                Text('Min Passengers: $minPassengers'),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (minPassengers > 0) {
                      onMinPassengersChange(minPassengers - 1);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    onMinPassengersChange(minPassengers + 1);
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text('Max Passengers: $maxPassengers'),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (maxPassengers > 0) {
                      onMaxPassengersChange(maxPassengers - 1);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    onMaxPassengersChange(maxPassengers + 1);
                  },
                ),
              ],
            ),
            DropdownButton<String>(
              hint: const Text('Select Trip Category'),
              value: tripCategory,
              onChanged: onTripCategoryChange,
              items: <String>['Category1', 'Category2', 'Category3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: const Text('Select Status'),
              value: tripStatus,
              onChanged: onTripStatusChange,
              items: <String>['Status1', 'Status2', 'Status3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: hotelPriceController,
              decoration: const InputDecoration(labelText: 'Hotel Price'),
              keyboardType: TextInputType.number,
              onChanged: onHotelPriceChange,
            ),
            TextField(
              controller: flightPriceController,
              decoration: const InputDecoration(labelText: 'Flight Price'),
              keyboardType: TextInputType.number,
              onChanged: onFlightPriceChange,
            ),
            TextField(
              controller: servicesPriceController,
              decoration: const InputDecoration(labelText: 'Services Price'),
              keyboardType: TextInputType.number,
              onChanged: onServicesPriceChange,
            ),
            Row(
              children: [
                const Text('Private Trip'),
                Switch(
                  value: isPrivate,
                  onChanged: onPrivacyChange,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
