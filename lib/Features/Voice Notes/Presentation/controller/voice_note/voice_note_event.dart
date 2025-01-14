part of 'voice_note_bloc.dart';

@freezed
class VoiceNoteEvent with _$VoiceNoteEvent {
  const factory VoiceNoteEvent.startRecording() = StartRecording;
  const factory VoiceNoteEvent.pauseRecording() = PauseRecording;
  const factory VoiceNoteEvent.stopRecording() = StopRecording;
  const factory VoiceNoteEvent.updateDuration() = UpdateDuration;
  const factory VoiceNoteEvent.saveVoiceNote(String title) = SaveVoiceNote;
  const factory VoiceNoteEvent.playVoiceNote(String id) = PlayVoiceNote;
  const factory VoiceNoteEvent.pauseVoiceNote(String id) = PauseVoiceNote;
  const factory VoiceNoteEvent.deleteVoiceNote(String id) = DeleteVoiceNote;
  const factory VoiceNoteEvent.fetchVoiceNotes() = FetchVoiceNotes;
  const factory VoiceNoteEvent.searchNotes(String query) = SearchNotes;
}
