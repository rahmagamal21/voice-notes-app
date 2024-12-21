import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_notes_app/Features/Voice%20Notes/Presentation/views/widgets/notes_list_item.dart';

class VoiceNotesScreen extends StatelessWidget {
  const VoiceNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> notes = [
      {"title": "Note1", "date": "14 Dec 2024"},
      {"title": "Note2", "date": "15 Dec 2024"},
      {"title": "Note3", "date": "16 Dec 2024"},
      {"title": "Note4", "date": "17 Dec 2024"}
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'My Notes',
            style: TextStyle(
                color: Color(0xff212121), fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 100.h,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return NotesListItem(
              title: notes[index]["title"] ?? '',
              date: notes[index]["date"] ?? '',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15.h,
            );
          },
          itemCount: notes.length,
          reverse: true,
          shrinkWrap: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xffF48FB1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const Icon(Icons.mic, size: 28),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
