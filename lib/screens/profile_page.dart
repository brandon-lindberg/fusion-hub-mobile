import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, String>> staff = [
    {'name': 'Staff 1', 'image': 'assets/profile_one.jpg', 'info': 'Info about Staff 1'},
    {'name': 'Staff 2', 'image': 'assets/profile_three.jpg', 'info': 'Info about Staff 2'},
    // Add more staff as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: ListView.builder(
        itemCount: staff.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.asset(staff[index]['image']!),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(staff[index]['name']!, style: TextStyle(fontSize: 20.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(staff[index]['info']!, style: TextStyle(fontSize: 16.0)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
