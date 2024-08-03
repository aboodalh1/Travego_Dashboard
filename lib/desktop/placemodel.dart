class Place {
  int id;
  String name;
  String description;
  String country;
  String city;
  String openingTime;
  String closingTime;
  Location location;
  String image;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.country,
    required this.city,
    required this.openingTime,
    required this.closingTime,
    required this.location,
    required this.image,
  });
}

class Location {
  int id;
  double latitude;
  double longitude;

  Location({
    required this.id,
    required this.latitude,
    required this.longitude,
  });
}
