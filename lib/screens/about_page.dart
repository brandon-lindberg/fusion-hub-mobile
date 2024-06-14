import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; 

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('about')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/about-banner.jpg'),
              const SizedBox(height: 16.0),
              Text(
                localizations.translate('CFHmission'),
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(localizations.translate('mission-statement-one')),
              const SizedBox(height: 16.0),
              _buildMissionSection(
                localizations.translate('mission-statment-two-head'), 
                localizations.translate('mission-statment-two')
              ),
              _buildMissionSection(
                localizations.translate('mission-statment-three-head'), 
                localizations.translate('mission-statment-three')
              ),
              _buildMissionSection(
                localizations.translate('mission-statment-four-head'), 
                localizations.translate('mission-statment-four')
              ),
              _buildMissionSection(
                localizations.translate('mission-statment-five-head'), 
                localizations.translate('mission-statment-five')
              ),
              _buildMissionSection(
                localizations.translate('mission-statment-six-head'), 
                localizations.translate('mission-statment-six')
              ),
              _buildMissionSection(
                localizations.translate('mission-statment-seven-head'), 
                localizations.translate('mission-statment-seven')
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMissionSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Text(content),
        ],
      ),
    );
  }
}
