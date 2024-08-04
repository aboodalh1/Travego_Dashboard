class TripModel {
  String tripName;
  String tripDescription;
  String tripCategory;
  DateTime tripStartDate;
  DateTime tripEndDate;
  int country;
  List<int> cities;
  List<int> hotels;
  String flightCompany;
  int minPassengers;
  int maxPassengers;
  String status;
  List<String> tripServices;
  double hotelPrice;
  double flightPrice;
  double servicesPrice;
  bool isPrivate;

  TripModel({
    required this.tripName,
    required this.tripDescription,
    required this.tripCategory,
    required this.tripStartDate,
    required this.tripEndDate,
    required this.country,
    required this.cities,
    required this.hotels,
    required this.flightCompany,
    required this.minPassengers,
    required this.maxPassengers,
    required this.status,
    required this.tripServices,
    required this.hotelPrice,
    required this.flightPrice,
    required this.servicesPrice,
    required this.isPrivate,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      tripName: json['tripName'],
      tripDescription: json['tripDescription'],
      tripCategory: json['tripCategory'],
      tripStartDate: DateTime.parse(json['tripStartDate']),
      tripEndDate: DateTime.parse(json['tripEndDate']),
      country: json['country'],
      cities: List<int>.from(json['cities']),
      hotels: List<int>.from(json['hotels']),
      flightCompany: json['flightCompany'],
      minPassengers: json['min_passengers'],
      maxPassengers: json['max_passengers'],
      status: json['status'],
      tripServices: List<String>.from(json['tripServices']),
      hotelPrice: json['hotelPrice'].toDouble(),
      flightPrice: json['flightPrice'].toDouble(),
      servicesPrice: json['servicesPrice'].toDouble(),
      isPrivate: json['isPrivate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripName': tripName,
      'tripDescription': tripDescription,
      'tripCategory': tripCategory,
      'tripStartDate': tripStartDate.toIso8601String(),
      'tripEndDate': tripEndDate.toIso8601String(),
      'country': country,
      'cities': cities,
      'hotels': hotels,
      'flightCompany': flightCompany,
      'min_passengers': minPassengers,
      'max_passengers': maxPassengers,
      'status': status,
      'tripServices': tripServices,
      'hotelPrice': hotelPrice,
      'flightPrice': flightPrice,
      'servicesPrice': servicesPrice,
      'isPrivate': isPrivate,
    };
  }
}
