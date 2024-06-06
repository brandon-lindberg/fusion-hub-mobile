import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/event.dart';

class EventService {
  Future<List<Event>> fetchEvents() async {
    final response = await rootBundle.loadString('assets/events.json');
    final data = jsonDecode(response) as List;
    return data.map((json) => Event.fromJson(json)).toList();
  }
}
