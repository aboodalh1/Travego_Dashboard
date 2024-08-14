class RoomService {
	int? id;
	String? name;

	RoomService({this.id, this.name});

	factory RoomService.fromJson(Map<String, dynamic> json) => RoomService(
				id: json['id'] as int?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
