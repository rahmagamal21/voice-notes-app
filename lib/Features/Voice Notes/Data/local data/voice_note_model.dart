import 'package:hive_flutter/hive_flutter.dart';

part 'voice_note_model.g.dart';

@HiveType(typeId: 1)
class VoiceNoteHive {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String filePath;

  @HiveField(3)
  final DateTime recordedDate;

  @HiveField(4)
  final int duration;

  VoiceNoteHive({
    required this.id,
    required this.title,
    required this.filePath,
    required this.recordedDate,
    required this.duration,
  });
}
