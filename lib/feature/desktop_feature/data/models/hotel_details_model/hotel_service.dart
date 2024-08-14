class HotelService {
	int? id;
	String? name;

	HotelService({this.id, this.name});

	factory HotelService.fromJson(Map<String, dynamic> json) => HotelService(
				id: json['id'] as int?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
