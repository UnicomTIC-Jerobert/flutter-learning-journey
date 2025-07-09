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

  // In BasicLayoutScreen's build method
  @override
  // In BasicLayoutScreen's build method
  @override
  Widget build(BuildContext context) {
    // A Row works exactly like a Column, but horizontally.
    return Row(
      // MainAxisAlignment now controls horizontal alignment.
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      // CrossAxisAlignment now controls vertical alignment.
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        _buildBox('Box 1', Colors.teal),
        _buildBox('Box 2', Colors.orange),
        _buildBox('Box 3', Colors.greenAccent),
        // With a Row, you can easily get an "overflow" error if the
        // children are too wide for the screen. We'll fix this next.
      ],
    );
  }

  // ... keep the _buildBox helper method ...

  // Helper method to avoid repetitive code.
  // The leading underscore makes this method private to this file.
  Widget _buildBox(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(20.0),
      color: color,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
