import 'photo.dart';

class Hotel {
	int? hotelId;
	String? hotelName;
	dynamic numOfRooms;
	int? stars;
	int? cityId;
	String? cityName;
	int? countryId;
	String? country;
	String? description;
	Photo? photo;

	Hotel({
		this.hotelId, 
		this.hotelName, 
		this.numOfRooms, 
		this.stars, 
		this.cityId, 
		this.cityName, 
		this.countryId, 
		this.country, 
		this.description, 
		this.photo, 
	});

	factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
				hotelId: json['hotelId'] as int?,
				hotelName: json['hotelName'] as String?,
				numOfRooms: json['num_of_rooms'] as dynamic,
				stars: json['stars'] as int?,
				cityId: json['cityId'] as int?,
				cityName: json['cityName'] as String?,
				countryId: json['countryId'] as int?,
				country: json['country'] as String?,
				description: json['description'] as String?,
				photo: json['photo'] == null
						? null
						: Photo.fromJson(json['photo'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'hotelId': hotelId,
				'hotelName': hotelName,
				'num_of_rooms': numOfRooms,
				'stars': stars,
				'cityId': cityId,
				'cityName': cityName,
				'countryId': countryId,
				'country': country,
				'description': description,
				'photo': photo?.toJson(),
			};
}
