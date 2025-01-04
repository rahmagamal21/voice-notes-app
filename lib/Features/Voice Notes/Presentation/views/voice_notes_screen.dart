import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_notes_app/Features/Voice%20Notes/Presentation/views/widgets/notes_list_item.dart';

import '../../../../core/src/all_colors.dart';
import '../controller/voice_note/voice_note_bloc.dart';
import 'widgets/bottom_sheet.dart';

class VoiceNotesScreen extends StatelessWidget {
  const VoiceNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'My Notes',
            style: TextStyle(
              color: Color(0xffed82e6), //Color(0xff212121),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 100.h,
        ),
        body: BlocBuilder<VoiceNoteBloc, VoiceNoteState>(
          builder: (context, state) {
            final notes = state.notes;
            if (notes.isEmpty) {
              return const Center(
                child: Text('Your Notes appears here!'),
              );
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NotesListItem(
                    note: note,
                    onPlay: () {
                      context
                          .read<VoiceNoteBloc>()
                          .add(VoiceNoteEvent.playVoiceNote(note.id));
                    },
                    onPause: () {
                      context
                          .read<VoiceNoteBloc>()
                          .add(VoiceNoteEvent.pauseVoiceNote(note.id));
                    },
                    onDelete: () {
                      context
                          .read<VoiceNoteBloc>()
                          .add(VoiceNoteEvent.deleteVoiceNote(note.id));
                    },
                    colors: gradients[index % gradients.length],
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
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<VoiceNoteBloc>().add(const StartRecording());
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (_) => const BottomSheetContent(),
            );
          },
          backgroundColor: const Color(0xffed82e6), //Color(0xffF48FB1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const Icon(
            Icons.mic,
            size: 28,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
