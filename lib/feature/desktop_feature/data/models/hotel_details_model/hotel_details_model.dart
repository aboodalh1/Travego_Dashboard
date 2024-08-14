import 'body.dart';

class HotelDetailsModel {
	String? message;
	String? status;
	DateTime? localDateTime;
	Body? body;

	HotelDetailsModel({
		this.message, 
		this.status, 
		this.localDateTime, 
		this.body, 
	});

	factory HotelDetailsModel.fromJson(Map<String, dynamic> json) {
		return HotelDetailsModel(
			message: json['message'] as String?,
			status: json['status'] as String?,
			localDateTime: json['localDateTime'] == null
						? null
						: DateTime.parse(json['localDateTime'] as String),
			body: json['body'] == null
						? null
						: Body.fromJson(json['body'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'status': status,
				'localDateTime': localDateTime?.toIso8601String(),
				'body': body?.toJson(),
			};
}
