import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement appointment creation logic
              },
              child: Text('Create an Appointment'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement waiting list logic
              },
              child: Text('Join Waiting List'),
            ),
          ],
        ),
      ),
    );
  }
}
