import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(170, 251, 220, 0.506), Color.fromRGBO(255, 200, 210, 0.533)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Text(
        'Menu',
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 24),
      ),
    );
  }
}
