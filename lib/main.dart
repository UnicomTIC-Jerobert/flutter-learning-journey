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
                  // Add our new stateful widget here!
                  const FavoriteButton(),
                ],
              ),

              // A divider line
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              const ContactInfoRow(
                icon: Icons.location_on,
                text: '123 Main St, Jaffna',
              ),
              const SizedBox(height: 8),
              const ContactInfoRow(
                icon: Icons.email,
                text: 'alex.doe@example.com',
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

// This is a reusable widget for a row containing an icon and text.
// It's stateless because once created with an icon and text, it never
// changes on its own.
class ContactInfoRow extends StatelessWidget {
  // The data this widget needs is passed in via the constructor.
  // These fields should always be 'final' in a StatelessWidget.
  final IconData icon;
  final String text;

  // The constructor. 'const' is a performance optimization.
  const ContactInfoRow({
    super.key,
    required this.icon, // 'required' means these must be provided.
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // The build method just describes the UI based on the final fields.
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

// 1. The Widget class (immutable configuration)
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  // The only required method is createState(). It links this widget
  // to its State object.
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

// 2. The State class (mutable, contains the logic and UI)
// The leading underscore makes this class private to the library (main.dart).
class _FavoriteButtonState extends State<FavoriteButton> {
  // This is the "state" that this widget manages.
  bool _isFavorited = false;

  // This is the equivalent of React's this.setState().
  // It does two things:
  // 1. Changes the state variable inside the callback.
  // 2. Tells the framework that this widget is "dirty" and needs to be
  //    rebuilt by calling its 'build' method again.
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    // The UI depends on the current value of our state variable, _isFavorited.
    return IconButton(
      icon: Icon(
        _isFavorited ? Icons.favorite : Icons.favorite_border,
        color: _isFavorited ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleFavorite, // Call our state-changing method on tap.
    );
  }
}
