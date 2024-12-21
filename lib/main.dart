import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_notes_app/Features/Voice%20Notes/Presentation/views/voice_notes_screen.dart';

import 'Features/Voice Notes/Presentation/controller/voice_note/voice_note_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 830),
        builder: (context, child) {
          return BlocProvider(
            create: (context) => VoiceNoteBloc(),
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: VoiceNotesScreen(),
            ),
          );
        });
  }
}
