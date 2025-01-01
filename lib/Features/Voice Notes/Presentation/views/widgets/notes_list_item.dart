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
  });

  final VoiceNote note;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onDelete;

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
    //DateTime newDate = DateTime.parse(note);
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = dateFormat.format(note.recordedDate);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.mic, color: Colors.blue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(formattedDate),
                    Text(
                      formatDuration(note.duration),
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
                    color: const Color(0xff1E88E5)),
                onPressed: note.isPlaying ? onPause : onPlay,
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
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
                  color: const Color(0xffCE93D8),
                  backgroundColor: Colors.grey.shade300,
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(8),
                );
              },
            ),
        ],
      ),
    );
  }
}
