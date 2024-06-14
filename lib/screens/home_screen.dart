import 'package:flutter/material.dart';
import '../main.dart';
import '../models/appointment.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Appointment>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = ApiService().fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cultural Fusion Hub'), 
      body: Center(
        child: FutureBuilder<List<Appointment>>(
          future: futureAppointments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No appointments available');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var appointment = snapshot.data![index];
                  return ListTile(
                    title: Text('Appointment ${appointment.id}'),
                    subtitle: Text('${appointment.startTime} - ${appointment.endTime}'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

