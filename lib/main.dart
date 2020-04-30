import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MainHub());

class MainHub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
