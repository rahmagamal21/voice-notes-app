import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voice_notes_app/Features/Voice%20Notes/Presentation/views/voice_notes_screen.dart';

import 'Features/Voice Notes/Data/local data/voice_note_model.dart';
import 'Features/Voice Notes/Data/voice_note_repository_implementation.dart';
import 'Features/Voice Notes/Presentation/controller/voice_note/voice_note_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(VoiceNoteHiveAdapter());
  final notesBox = await Hive.openBox<VoiceNoteHive>('voice_notes');
  runApp(MyApp(
    repository: HiveVoiceNoteRepository(notesBox),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.repository});
  final HiveVoiceNoteRepository repository;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 830),
        builder: (context, child) {
          return BlocProvider(
            create: (context) => VoiceNoteBloc(repository),
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: VoiceNotesScreen(),
            ),
          );
        });
  }
}
