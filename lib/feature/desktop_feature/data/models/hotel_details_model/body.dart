import 'hotel.dart';
import 'hotel_service.dart';
import 'photo.dart';
import 'room.dart';

class Body {
	int? id;
	String? startTime;
	String? endTime;
	int? priceForExtraBed;
	int? distanceFromCity;
	int? breakfastPrice;
	Hotel? hotel;
	List<Room>? room;
	List<dynamic>? commentReviews;
	List<HotelService>? hotelServices;
	List<Photo>? photo;
	int? security;
	int? location;
	int? facilities;
	int? cleanliness;
	int? averageRating;

	Body({
		this.id, 
		this.startTime, 
		this.endTime, 
		this.priceForExtraBed, 
		this.distanceFromCity, 
		this.breakfastPrice, 
		this.hotel, 
		this.room, 
		this.commentReviews, 
		this.hotelServices, 
		this.photo, 
		this.security, 
		this.location, 
		this.facilities, 
		this.cleanliness, 
		this.averageRating, 
	});

	factory Body.fromJson(Map<String, dynamic> json) => Body(
				id: json['id'] as int?,
				startTime: json['startTime'] as String?,
				endTime: json['endTime'] as String?,
				priceForExtraBed: json['priceForExtraBed'] as int?,
				distanceFromCity: json['distanceFromCity'] as int?,
				breakfastPrice: json['breakfastPrice'] as int?,
				hotel: json['hotel'] == null
						? null
						: Hotel.fromJson(json['hotel'] as Map<String, dynamic>),
				room: (json['room'] as List<dynamic>?)
						?.map((e) => Room.fromJson(e as Map<String, dynamic>))
						.toList(),
				commentReviews: json['commentReviews'] as List<dynamic>?,
				hotelServices: (json['hotelServices'] as List<dynamic>?)
						?.map((e) => HotelService.fromJson(e as Map<String, dynamic>))
						.toList(),
				photo: (json['photo'] as List<dynamic>?)
						?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
						.toList(),
				security: json['security'] as int?,
				location: json['location'] as int?,
				facilities: json['facilities'] as int?,
				cleanliness: json['cleanliness'] as int?,
				averageRating: json['averageRating'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'startTime': startTime,
				'endTime': endTime,
				'priceForExtraBed': priceForExtraBed,
				'distanceFromCity': distanceFromCity,
				'breakfastPrice': breakfastPrice,
				'hotel': hotel?.toJson(),
				'room': room?.map((e) => e.toJson()).toList(),
				'commentReviews': commentReviews,
				'hotelServices': hotelServices?.map((e) => e.toJson()).toList(),
				'photo': photo?.map((e) => e.toJson()).toList(),
				'security': security,
				'location': location,
				'facilities': facilities,
				'cleanliness': cleanliness,
				'averageRating': averageRating,
			};
}
