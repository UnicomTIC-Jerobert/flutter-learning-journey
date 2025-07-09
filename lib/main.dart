// lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Let's remove the debug banner for a cleaner look
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Layouts'),
          elevation: 4.0, // Adds a subtle shadow to the app bar
        ),
        // We will build our layout in a separate widget for cleanliness.
        body: BasicLayoutScreen(),
      ),
    );
  }
}

// This is where we will do all our work for this lesson.
class BasicLayoutScreen extends StatelessWidget {
  const BasicLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, it's just an empty container.
    return Container(
      // Styling properties
      color: Colors.blueGrey[100], // A light grey-blue background color
      margin: const EdgeInsets.all(20.0), // Outer space (like CSS margin)
      padding: const EdgeInsets.all(10.0), // Inner space (like CSS padding)
      // Sizing properties
      width: 200.0,
      height: 100.0,

      // The widget to place inside the container
      child: Container(color: Colors.red, child: const Text('Hello')),
    );
  }
}
