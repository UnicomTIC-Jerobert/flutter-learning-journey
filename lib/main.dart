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
  Widget build(BuildContext context) {
    // A Column takes a list of widgets as its children.
    return Column(
      // MainAxisAlignment controls alignment along the main (vertical) axis.
      // Try changing this to .start, .end, .center, .spaceAround, .spaceBetween
      mainAxisAlignment: MainAxisAlignment.center,

      // CrossAxisAlignment controls alignment along the cross (horizontal) axis.
      // Try changing this to .start, .end, .center, .stretch
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Let's create a reusable "box" widget for demonstration
        _buildBox('Box 1', Colors.teal),
        _buildBox('Box 2', Colors.orange),
        _buildBox('Box 3', Colors.indigo),
      ],
    );
  }

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
