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
    return Column(
      children: [
        // This Row takes up only the height it needs.
        Row(
          children: [
            _buildBox('Fixed Width', Colors.red),
            // This Expanded widget will take up ALL remaining horizontal space.
            Expanded(child: _buildBox('Expanded', Colors.green)),
          ],
        ),

        // This Expanded widget will take up ALL remaining VERTICAL space in the Column.
        Expanded(child: _buildBox('Expanded to fill height', Colors.blue)),

        _buildBox('Bottom Box', Colors.purple),
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
