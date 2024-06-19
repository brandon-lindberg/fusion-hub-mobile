import 'package:flutter/material.dart';
import '../main.dart';
import '../models/event.dart';
import '../services/event_service.dart';
import 'event_details_page.dart';
import 'package:intl/intl.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late Future<List<Event>> futureEvents;
  bool showPastEvents = false;

  @override
  void initState() {
    super.initState();
    futureEvents = EventService().fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormat = DateFormat('h:mm a');

    return Scaffold(
      appBar: const CustomAppBar(title: 'Events'),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0), // Add margin-top and margin-bottom
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showPastEvents = !showPastEvents;
                });
              },
              child: Text(showPastEvents ? 'Show Upcoming Events' : 'Show Past Events'),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Event>>(
              future: futureEvents,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No events available');
                } else {
                  List<Event> events = snapshot.data!;
                  DateTime now = DateTime.now();
                  if (!showPastEvents) {
                    events = events.where((event) => event.start.isAfter(now)).toList();
                  } else {
                    events = events.where((event) => event.start.isBefore(now)).toList();
                    events.sort((a, b) => b.start.compareTo(a.start)); // Sort past events from most recent to least recent
                  }

                  return ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      var event = events[index];
                      return ListTile(
                        title: Text(event.title),
                        subtitle: Text(
                          '${event.description}\nDate: ${dateFormat.format(event.start)}\nStart Time: ${timeFormat.format(event.start)}',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailsPage(event: event),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
