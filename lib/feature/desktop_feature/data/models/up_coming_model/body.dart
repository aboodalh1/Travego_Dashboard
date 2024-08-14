class Body {
  int? tripId;
  String? tripName;
  String? tripDescription;
  String? tripCategory;
  String? tripStartDate;
  String? tripEndDate;
  String? country;
  List<dynamic>? cities;
  List<dynamic>? hotels;
  String? flightCompany;
  int? minPassengers;
  int? maxPassengers;
  String? status;
  List<dynamic>? tripServices;
  int? price;
  String? isPrivate;
  bool? isFavourite;

  Body({
    this.tripId,
    this.tripName,
    this.tripDescription,
    this.tripCategory,
    this.tripStartDate,
    this.tripEndDate,
    this.country,
    this.cities,
    this.hotels,
    this.flightCompany,
    this.minPassengers,
    this.maxPassengers,
    this.status,
    this.tripServices,
    this.price,
    this.isPrivate,
    this.isFavourite,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        tripId: json['tripId'] as int?,
        tripName: json['tripName'] as String?,
        tripDescription: json['tripDescription'] as String?,
        tripCategory: json['tripCategory'] as String?,
        tripStartDate: json['tripStartDate'] as String?,
        tripEndDate: json['tripEndDate'] as String?,
        country: json['country'] as String?,
        cities: json['cities'] as List<dynamic>?,
        hotels: json['hotels'] as List<dynamic>?,
        flightCompany: json['flightCompany'] as String?,
        minPassengers: json['min_passengers'] as int?,
        maxPassengers: json['max_passengers'] as int?,
        status: json['status'] as String?,
        tripServices: json['tripServices'] as List<dynamic>?,
        price: json['price'] as int?,
        isPrivate: json['isPrivate'] as String?,
        isFavourite: json['isFavourite'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'tripId': tripId,
        'tripName': tripName,
        'tripDescription': tripDescription,
        'tripCategory': tripCategory,
        'tripStartDate': tripStartDate,
        'tripEndDate': tripEndDate,
        'country': country,
        'cities': cities,
        'hotels': hotels,
        'flightCompany': flightCompany,
        'min_passengers': minPassengers,
        'max_passengers': maxPassengers,
        'status': status,
        'tripServices': tripServices,
        'price': price,
        'isPrivate': isPrivate,
        'isFavourite': isFavourite,
      };
}
