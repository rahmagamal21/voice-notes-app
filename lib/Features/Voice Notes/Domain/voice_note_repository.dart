import 'voice_note_entity.dart';

abstract class VoiceNoteRepository {
  Future<void> saveVoiceNote(VoiceNote voiceNote);
  Future<void> deleteVoiceNote(String id);
  Future<List<VoiceNote>> fetchVoiceNotes();
}
