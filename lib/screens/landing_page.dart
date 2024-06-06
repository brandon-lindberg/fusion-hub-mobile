import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';
import '../services/event_service.dart';
import '../models/event.dart';
import 'package:intl/intl.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> imgList = [
    'assets/one.jpg',
    'assets/two.jpg',
    'assets/three.jpg',
    'assets/four.jpg',
    'assets/five.jpg',
  ];

  late Future<List<Event>> futureEvents;

  @override
  void initState() {
    super.initState();
    futureEvents = EventService().fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('home')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 400.0, autoPlay: true),
              items: imgList.map((item) => Image.asset(item)).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                AppLocalizations.of(context)!.translate('greeting'),
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            FutureBuilder<List<Event>>(
              future: futureEvents,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No events available');
                } else {
                  return TableCalendar(
                    firstDay: DateTime.utc(2020, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    eventLoader: (day) {
                      return snapshot.data!
                          .where((event) => isSameDay(event.start, day))
                          .toList();
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      List<Event> events = snapshot.data!
                          .where((event) => isSameDay(event.start, selectedDay))
                          .toList();
                      if (events.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(events.first.title),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(events.first.description),
                                  SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _showRegistrationForm(context, events.first);
                                    },
                                    child: Text(AppLocalizations.of(context)!.translate('register')),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(AppLocalizations.of(context)!.translate('close')),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('about')),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('profile')),
              onTap: () => Navigator.pushNamed(context, '/profile')),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('appointments')),
              onTap: () => Navigator.pushNamed(context, '/appointments')),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('contact')),
              onTap: () => Navigator.pushNamed(context, '/contact')),
            const Divider(),
            ListTile(
              leading: const Text('🇬🇧'),
              title: const Text('English'),
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false).setLocale(const Locale('en'));
              },
            ),
            ListTile(
              leading: const Text('🇯🇵'),
              title: const Text('日本語'),
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false).setLocale(const Locale('ja'));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showRegistrationForm(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register for ${event.title}'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(labelText: 'Event', hintText: event.title, enabled: false)),
                TextField(decoration: const InputDecoration(labelText: 'Family Name')),
                TextField(decoration: const InputDecoration(labelText: 'Family Name Kana')),
                TextField(decoration: const InputDecoration(labelText: 'First Name')),
                TextField(decoration: const InputDecoration(labelText: 'First Name Kana')),
                TextField(decoration: const InputDecoration(labelText: 'Email')),
                TextField(decoration: const InputDecoration(labelText: 'Phone')),
                TextField(
                  decoration: const InputDecoration(labelText: 'Number of Children'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Handle child fields rendering
                  },
                ),
                TextField(decoration: const InputDecoration(labelText: 'Personal Message')),
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
