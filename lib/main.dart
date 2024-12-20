import 'package:flutter/material.dart';
import 'package:voice_notes_app/Features/Voice%20Notes/Presentation/views/voice_notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VoiceNotesScreen(),
    );
  }
}
