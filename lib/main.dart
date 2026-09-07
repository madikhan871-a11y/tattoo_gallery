import 'package:flutter/material.dart';
import 'screens/gallery_screen.dart';

void main() {
  runApp(const TattooGalleryApp());
}

class TattooGalleryApp extends StatelessWidget {
  const TattooGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ink & Art',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0E12),
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE7B8FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const GalleryScreen(),
    );
  }
}