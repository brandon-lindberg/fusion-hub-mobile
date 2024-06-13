import 'package:flutter/material.dart';
import '../models/event.dart';
import 'package:intl/intl.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormat = DateFormat('h:mm a');

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${dateFormat.format(event.start)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Start Time: ${timeFormat.format(event.start)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'End Time: ${timeFormat.format(event.end)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            Text(event.description, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showRegistrationForm(context);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void _showRegistrationForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register for ${event.title}'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(labelText: 'Event', hintText: event.title, enabled: false)),
                const TextField(decoration: InputDecoration(labelText: 'Family Name')),
                const TextField(decoration: InputDecoration(labelText: 'Family Name Kana')),
                const TextField(decoration: InputDecoration(labelText: 'First Name')),
                const TextField(decoration: InputDecoration(labelText: 'First Name Kana')),
                const TextField(decoration: InputDecoration(labelText: 'Email')),
                const TextField(decoration: InputDecoration(labelText: 'Phone')),
                TextField(
                  decoration: const InputDecoration(labelText: 'Number of Children'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Handle child fields rendering
                  },
                ),
                const TextField(decoration: InputDecoration(labelText: 'Personal Message')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Implement registration logic
                Navigator.of(context).pop();
              },
              child: const Text('Register'),
            ),
          ],
        );
      },
    );
  }
}


