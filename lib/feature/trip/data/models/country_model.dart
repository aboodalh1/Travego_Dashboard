class CountryModel {
  final int id;
  final String name;
  final String iso;
  final String iso3;
  final String dial;
  final String? currency;
  final String? currencyName;

  CountryModel({
    required this.id,
    required this.name,
    required this.iso,
    required this.iso3,
    required this.dial,
    this.currency,
    this.currencyName,
  });

  // Factory method to create a Country from JSON
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      iso: json['iso'],
      iso3: json['iso3'],
      dial: json['dial'],
      currency: json['currency'],
      currencyName: json['currency_name'],
    );
  }

  // Method to convert a Country to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'iso': iso,
      'iso3': iso3,
      'dial': dial,
      'currency': currency,
      'currency_name': currencyName,
    };
  }
}
