import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NopeApp());
}

class NopeApp extends StatelessWidget {
  const NopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nope!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontFamily: 'Inter'),
          headlineMedium: TextStyle(fontFamily: 'Inter'),
          headlineSmall: TextStyle(fontFamily: 'Inter'),
          titleLarge: TextStyle(fontFamily: 'Inter'),
          titleMedium: TextStyle(fontFamily: 'Inter'),
          titleSmall: TextStyle(fontFamily: 'Inter'),
          bodyLarge: TextStyle(fontFamily: 'Inter'),
          bodyMedium: TextStyle(fontFamily: 'Inter'),
          bodySmall: TextStyle(fontFamily: 'Inter'),
        ),
      ),
      home: const HomeScreen(),
    );
  }
} 