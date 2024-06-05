import 'models/appointment.dart';

class MockData {
  static List<Appointment> appointments = [
    Appointment(
      id: 1,
      userId: 1,
      startTime: DateTime.parse('2024-06-05T10:00:00.000Z'),
      endTime: DateTime.parse('2024-06-05T11:00:00.000Z'),
      status: 'confirmed',
    ),
    Appointment(
      id: 2,
      userId: 1,
      startTime: DateTime.parse('2024-06-06T14:00:00.000Z'),
      endTime: DateTime.parse('2024-06-06T15:00:00.000Z'),
      status: 'pending',
    ),
  ];
}
