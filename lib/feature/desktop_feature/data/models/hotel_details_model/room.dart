import 'room_service.dart';

class Room {
	int? id;
	int? numOfBed;
	double? space;
	int? maxNumOfPeople;
	double? price;
	List<RoomService>? roomServices;
	String? type;
	int? totalNumberOfRooms;

	Room({
		this.id, 
		this.numOfBed, 
		this.space, 
		this.maxNumOfPeople, 
		this.price, 
		this.roomServices, 
		this.type, 
		this.totalNumberOfRooms, 
	});

	factory Room.fromJson(Map<String, dynamic> json) => Room(
				id: json['id'] as int?,
				numOfBed: json['num_of_bed'] as int?,
				space: (json['space'] as num?)?.toDouble(),
				maxNumOfPeople: json['maxNumOfPeople'] as int?,
				price: (json['price'] as num?)?.toDouble(),
				roomServices: (json['roomServices'] as List<dynamic>?)
						?.map((e) => RoomService.fromJson(e as Map<String, dynamic>))
						.toList(),
				type: json['type'] as String?,
				totalNumberOfRooms: json['totalNumberOfRooms'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'num_of_bed': numOfBed,
				'space': space,
				'maxNumOfPeople': maxNumOfPeople,
				'price': price,
				'roomServices': roomServices?.map((e) => e.toJson()).toList(),
				'type': type,
				'totalNumberOfRooms': totalNumberOfRooms,
			};
}
