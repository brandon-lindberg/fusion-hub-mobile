// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/appointment.dart';

// class ApiService {
//   static const String baseUrl = 'http://localhost:3001';

//   Future<List<Appointment>> fetchAppointments() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/appointments'));

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         return jsonResponse.map((appointment) => Appointment.fromJson(appointment)).toList();
//       } else {
//         throw Exception('Failed to load appointments');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Connection failed: $e');
//     }
//   }
// }
import 'dart:async';
import '../mock_data.dart';
import '../models/appointment.dart';

class ApiService {
  Future<List<Appointment>> fetchAppointments() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // Return mock data
    return MockData.appointments;
  }
}
