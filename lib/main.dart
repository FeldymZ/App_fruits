import 'package:app_fruits/screen1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App_fruits());
}

// ignore: camel_case_types
class App_fruits extends StatelessWidget {
  const App_fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}
