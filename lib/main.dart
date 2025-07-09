// The 'material.dart' library contains all the core Material Design widgets
// like MaterialApp, Scaffold, AppBar, Text, etc.
import 'package:flutter/material.dart';

// The main() function is the entry point for all Dart applications, just like
// in Java or C#. Flutter execution starts here.
void main() {
  // runApp() is a built-in Flutter function that takes a Widget and makes it
  // the root of the widget tree. This inflates the given widget and attaches
  // it to the screen.
  runApp(const MyApp());
}

// In Flutter, everything is a widget. Your application itself is a widget.
// We create our root widget, MyApp.
// It's a StatelessWidget because the app itself doesn't hold any state that
// changes over time. It just defines the app's theme and initial route.
class MyApp extends StatelessWidget {
  // 'const' constructor. This is a performance optimization. If the widget
  // is created with the same arguments, Dart can reuse the existing instance.
  const MyApp({super.key});

  // The 'build' method is the most important method in any widget.
  // It describes the widget's part of the user interface.
  // Flutter calls this method whenever it needs to render the widget.
  // It's conceptually similar to React's `render()` method.
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a fundamental root widget. It sets up a lot of things
    // you need for a typical application:
    // - Navigation / Routing
    // - Theming (colors, fonts, etc.)
    // - It's the parent for other key widgets like Scaffold.
    return MaterialApp(
      // The 'home' property defines the default screen (the widget for the '/' route).
      // We are providing a Scaffold widget as our home screen.
      home: Scaffold(
        // Scaffold is a widget that implements the basic Material Design
        // visual layout structure. It provides APIs for showing app bars,
        // drawers, snack bars, and most importantly, a 'body'.
        appBar: AppBar(title: const Text('My Minimal App')),
        // The 'body' is the primary content of the Scaffold, shown below the AppBar.
        // We'll just put a centered piece of text here for now.
        body: const Center(
          child: Text('Hello, World!', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
