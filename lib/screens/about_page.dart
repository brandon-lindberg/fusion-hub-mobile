import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/about-banner.jpg'),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Information about the site.',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
