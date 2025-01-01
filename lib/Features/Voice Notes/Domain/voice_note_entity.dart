import 'package:just_audio/just_audio.dart';

class VoiceNote {
  final String id;
  final String title;
  final String filePath;
  final DateTime recordedDate;
  final int duration;
  final AudioPlayer audioPlayer;
  bool isPlaying;

  VoiceNote({
    required this.id,
    required this.title,
    required this.filePath,
    required this.recordedDate,
    required this.duration,
    this.isPlaying = false,
  }) : audioPlayer = AudioPlayer();
  VoiceNote copyWith({
    String? id,
    String? title,
    String? filePath,
    DateTime? recordedDate,
    int? duration,
    bool? isPlaying,
  }) {
    return VoiceNote(
      id: id ?? this.id,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      recordedDate: recordedDate ?? this.recordedDate,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}
