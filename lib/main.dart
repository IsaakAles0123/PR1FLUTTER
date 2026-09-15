import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

void main() {
  runApp(const Pr1App());
}

class Pr1App extends StatelessWidget {
  const Pr1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ПР1 — Макеты Flutter',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomeScreen(),
    );
  }
}
