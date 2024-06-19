import 'package:flutter/material.dart';

import '../main.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Contact Page'), 
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 20.0),
            ),
            // Add contact information here
          ],
        ),
      ),
    );
  }
}
