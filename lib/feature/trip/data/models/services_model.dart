// "hotelId": 1,
// "hotelName": "Gaza Grand Hotel",


class ServiceModel {
  final int id;
  final String name;


  ServiceModel( {
    required this.id,
    required this.name
  });

  // Factory method to create a Country from JSON
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  // Method to convert a Country to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,

    };
  }
}
