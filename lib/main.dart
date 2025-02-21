import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterSystemOverlay());
}

class FlutterSystemOverlay extends StatelessWidget {
  const FlutterSystemOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    
    );
  }
}


 