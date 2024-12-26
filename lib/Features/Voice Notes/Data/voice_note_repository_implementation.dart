import 'package:hive_flutter/hive_flutter.dart';

import '../Domain/voice_note_entity.dart';
import '../Domain/voice_note_repository.dart';
import 'local data/voice_note_model.dart';

class HiveVoiceNoteRepository implements VoiceNoteRepository {
  final Box<VoiceNoteHive> voiceNoteBox;

  HiveVoiceNoteRepository(this.voiceNoteBox);

  @override
  Future<void> saveVoiceNote(VoiceNote voiceNote) async {
    final note = VoiceNoteHive(
      id: voiceNote.id,
      title: voiceNote.title,
      filePath: voiceNote.filePath,
      recordedDate: voiceNote.recordedDate,
      duration: voiceNote.duration,
    );
    await voiceNoteBox.put(note.id, note);
  }

  @override
  Future<void> deleteVoiceNote(String id) async {
    await voiceNoteBox.delete(id);
  }

  @override
  Future<List<VoiceNote>> fetchVoiceNotes() async {
    return voiceNoteBox.values.map((note) {
      return VoiceNote(
        id: note.id,
        title: note.title,
        filePath: note.filePath,
        recordedDate: note.recordedDate,
        duration: note.duration,
      );
    }).toList();
  }
}
