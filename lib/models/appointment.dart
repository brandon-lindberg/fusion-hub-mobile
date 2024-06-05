// lib/models/appointment.dart
class Appointment {
  final int id;
  final int userId;
  final DateTime startTime;
  final DateTime endTime;
  final String status;

  Appointment({
    required this.id,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      userId: json['user_id'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      status: json['status'],
    );
  }
}
