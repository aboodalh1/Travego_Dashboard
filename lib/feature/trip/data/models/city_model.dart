// {
// "id": 5,
// "cityName": "Cairo",
// "countryName": "Egypt"
// },

class CityModel {
  final int id;
  final String cityName;
  final String countryName;


  CityModel( {
    required this.id,
    required this.cityName, required this.countryName,
  });

  // Factory method to create a Country from JSON
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      cityName: json['cityName'],
      countryName: json['countryName'],
    );
  }

  // Method to convert a Country to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'countryName': countryName,
      'cityName': cityName,

    };
  }
}
