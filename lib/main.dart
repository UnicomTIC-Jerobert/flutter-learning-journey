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
    return Container(
      // A grey background for the whole screen
      color: Colors.grey[200],
      // Center the card on the screen
      child: Center(
        // A Container for our card
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            // This makes the Column's height fit its content.
            mainAxisSize: MainAxisSize.min,
            // Aligns children to the start (left) of the column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row for Avatar and Name/Title
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  // A SizedBox provides a fixed-size gap between widgets
                  const SizedBox(width: 16),
                  // Expanded makes the name/title column take all remaining horizontal space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Alex Doe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Senior Flutter Developer',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // A divider line
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              // Row for contact info
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('San Francisco, CA'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.email, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('alex.doe@example.com'),
                ],
              ),

              // Add this code at the end of the main Column's children list
              // (after the email Row)
              const SizedBox(height: 24), // Add some space before buttons

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {}, // Empty function for now
                      child: const Text('CALL'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('MESSAGE'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
