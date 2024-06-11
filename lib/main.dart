import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
import 'providers/locale_provider.dart';
import 'screens/landing_page.dart';
import 'screens/about_page.dart';
import 'screens/profile_page.dart';
import 'screens/appointments_page.dart';
import 'screens/contact_page.dart';

void main() {
  runApp(const AppointmentApp());
}

class AppointmentApp extends StatelessWidget {
  const AppointmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            title: 'Appointment App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: localeProvider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale == null) {
                return supportedLocales.first;
              }

              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }

              return supportedLocales.first;
            },
            initialRoute: '/',
            routes: {
              '/': (context) => const LandingPage(),
              '/about': (context) => const AboutPage(),
              '/profile': (context) => ProfilePage(),
              '/appointments': (context) => const AppointmentsPage(),
              '/contact': (context) => const ContactPage(),
            },
          );
        },
      ),
    );
  }
}
