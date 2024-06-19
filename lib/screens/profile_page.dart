import 'package:flutter/material.dart';
import '../main.dart';
import '../l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, String>> staff = [
    {'name': 'Obikane Yuka', 'image': 'assets/profile_one.jpg', 'info': 'yuka-description'},
    {'name': 'Peterson Saho', 'image': 'assets/profile_three.jpg', 'info': 'saho-description'},
    // Add more staff as needed
  ];

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile Page'),
      body: ListView.builder(
        itemCount: staff.length,
        itemBuilder: (context, index) {
          String name = staff[index]['name']!;
          String image = staff[index]['image']!;
          String infoKey = staff[index]['info']!;
          String description = AppLocalizations.of(context)!.translate(infoKey);

          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileDetailsPage(
                      name: name,
                      image: image,
                      description: description.replaceAll('<br>', '\n'),
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.asset(image),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description.replaceAll('<br>', '\n'),
                      style: const TextStyle(fontSize: 16.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  ProfileDetailsPage({super.key, required this.name, required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            const SizedBox(height: 16.0),
            Text(
              name,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              description,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
