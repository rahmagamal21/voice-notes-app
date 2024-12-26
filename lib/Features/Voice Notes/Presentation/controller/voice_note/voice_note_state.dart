part of 'voice_note_bloc.dart';

@freezed
class VoiceNoteState with _$VoiceNoteState {
  const factory VoiceNoteState({
    required bool isRecording,
    required bool isPaused,
    required int recordingDuration,
    required int currentRecordingDuration,
    required List<VoiceNote> notes,
  }) = _VoiceNoteState;

  factory VoiceNoteState.initial() => const VoiceNoteState(
        isRecording: false,
        isPaused: false,
        recordingDuration: 0,
        currentRecordingDuration: 0,
        notes: [],
      );
}
