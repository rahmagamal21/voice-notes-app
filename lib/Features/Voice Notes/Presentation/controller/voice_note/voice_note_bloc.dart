import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../Domain/voice_note_entity.dart';
import '../../../Domain/voice_note_repository.dart';

part 'voice_note_state.dart';
part 'voice_note_event.dart';
part 'voice_note_bloc.freezed.dart';

class VoiceNoteBloc extends Bloc<VoiceNoteEvent, VoiceNoteState> {
  final RecorderController recorderController = RecorderController();
  final VoiceNoteRepository repository;
  Timer? timer;
  VoiceNoteBloc(this.repository) : super(VoiceNoteState.initial()) {
    on<StartRecording>((event, emit) {
      recorderController.reset();
      recorderController.record();
      emit(state.copyWith(isRecording: true, currentRecordingDuration: 0));
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        add(const UpdateDuration());
      });
    });
    on<UpdateDuration>((event, emit) {
      if (!state.isPaused) {
        emit(state.copyWith(
            currentRecordingDuration: state.currentRecordingDuration + 1));
      }
    });

    on<PauseRecording>((event, emit) {
      if (state.isPaused) {
        recorderController.record();
      } else {
        recorderController.pause();
      }
      emit(state.copyWith(isPaused: !state.isPaused));
    });

    on<StopRecording>((event, emit) {
      recorderController.stop();
      timer?.cancel();
      emit(state.copyWith(
        isRecording: false,
        isPaused: false,
        recordingDuration: state.currentRecordingDuration,
        currentRecordingDuration: 0,
      ));
    });
    on<SaveVoiceNote>((event, emit) async {
      final id = DateTime.now().toIso8601String();
      final filePath = 'path/to/recorded/file/$id.m4a';

      final newNote = VoiceNote(
        id: id,
        title: event.title,
        filePath: filePath,
        recordedDate: DateTime.now(),
        duration: state.recordingDuration,
      );
      await repository.saveVoiceNote(newNote);
      final updatedNotes = await repository.fetchVoiceNotes();
      emit(state.copyWith(notes: updatedNotes));
    });

    on<DeleteVoiceNote>((event, emit) async {
      await repository.deleteVoiceNote(event.id);
      final updatedNotes = await repository.fetchVoiceNotes();
      emit(state.copyWith(notes: updatedNotes));
    });

    on<FetchVoiceNotes>((event, emit) async {
      final notes = await repository.fetchVoiceNotes();
      emit(state.copyWith(notes: notes));
    });
  }
  @override
  Future<void> close() {
    timer?.cancel();
    recorderController.dispose();
    return super.close();
  }
}
