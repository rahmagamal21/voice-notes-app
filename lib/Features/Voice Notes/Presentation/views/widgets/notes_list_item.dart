import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../Domain/voice_note_entity.dart';

class NotesListItem extends StatelessWidget {
  const NotesListItem({
    super.key,
    required this.note,
    required this.onPlay,
    required this.onPause,
    required this.onDelete,
    required this.colors,
  });

  final VoiceNote note;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onDelete;
  final List<Color> colors;

  String formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final remainingSeconds = seconds % 60;

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = dateFormat.format(note.recordedDate);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  // CircleAvatar(
                  //   backgroundColor: Colors.blue.shade100,
                  //   child:
                  //       const Icon(Icons.graphic_eq_rounded, color: Colors.white),
                  // ),
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child:
                          Icon(Icons.graphic_eq_rounded, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          note.title,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 124, 123, 123),
                          ),
                        ),
                        Text(
                          formatDuration(note.duration),
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      note.isPlaying
                          ? Icons.pause
                          : Icons.play_circle_fill_rounded,
                      size: 32,
                      color: const Color(0xff82e6ed),
                    ),
                    onPressed: note.isPlaying ? onPause : onPlay,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 204, 18, 5),
                    ),
                    onPressed: onDelete,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              if (note.isPlaying)
                StreamBuilder<Duration>(
                  stream: note.audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    final totalDuration =
                        note.audioPlayer.duration ?? Duration.zero;
                    if (totalDuration == Duration.zero) {
                      return const SizedBox.shrink();
                    }
                    final progress =
                        position.inMilliseconds / totalDuration.inMilliseconds;

                    return LinearProgressIndicator(
                      value: progress,
                      color: const Color(0xffe648d6), //Color(0xffCE93D8),
                      backgroundColor: Colors.grey.shade300,
                      minHeight: 4,
                      borderRadius: BorderRadius.circular(8),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
