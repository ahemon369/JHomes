import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const JHomesApp());
}

class JHomesApp extends StatelessWidget {
  const JHomesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JHomes — Monthly Property Rental Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Onest',
      ),
      home: const HomePage(),
    );
  }
}
