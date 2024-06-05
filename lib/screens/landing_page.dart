import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';

class LandingPage extends StatelessWidget {
  final List<String> imgList = [
    'assets/one.jpg',
    'assets/two.jpg',
    'assets/three.jpg',
    'assets/four.jpg',
    'assets/five.jpg',
  ];

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
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                onDaySelected: (selectedDay, focusedDay) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(AppLocalizations.of(context)!.translate('event-description')),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(AppLocalizations.of(context)!.translate('close')),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('about')),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('profile')),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('appointments')),
              onTap: () => Navigator.pushNamed(context, '/appointments'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.translate('contact')),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            Divider(),
            ListTile(
              leading: Text('🇬🇧'),
              title: Text('English'),
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false).setLocale(Locale('en'));
              },
            ),
            ListTile(
              leading: Text('🇯🇵'),
              title: Text('日本語'),
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false).setLocale(Locale('ja'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

