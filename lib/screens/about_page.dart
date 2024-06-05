import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/about-banner.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
