import 'body.dart';

class TripsWithStatusModel {
  String? message;
  String? status;
  DateTime? localDateTime;
  List<Body>? body;

  TripsWithStatusModel(
      {this.message, this.status, this.localDateTime, this.body});

  factory TripsWithStatusModel.fromJson(Map<String, dynamic> json) =>
      TripsWithStatusModel(
        message: json['message'] as String?,
        status: json['status'] as String?,
        localDateTime: json['localDateTime'] == null
            ? null
            : DateTime.parse(json['localDateTime'] as String),
        body: (json['body'] as List<dynamic>?)
            ?.map((e) => Body.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'localDateTime': localDateTime?.toIso8601String(),
        'body': body?.map((e) => e.toJson()).toList(),
      };
}
