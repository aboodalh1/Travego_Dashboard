// "hotelId": 1,
// "hotelName": "Gaza Grand Hotel",


class HotelModel {
  final int id;
  final String hotelName;


  HotelModel( {
    required this.id,
    required this.hotelName
  });

  // Factory method to create a Country from JSON
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['hotelId'],
      hotelName: json['hotelName'],
    );
  }

  // Method to convert a Country to JSON
  Map<String, dynamic> toJson() {
    return {
      'hotelId': id,
      'hotelName': hotelName,

    };
  }
}
