import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_note_state.dart';
part 'voice_note_event.dart';
part 'voice_note_bloc.freezed.dart';

class VoiceNoteBloc extends Bloc<VoiceNoteEvent, VoiceNoteState> {
  final RecorderController recorderController = RecorderController();
  Timer? timer;
  VoiceNoteBloc() : super(VoiceNoteState.initial()) {
    on<StartRecording>((event, emit) {
      recorderController.reset();
      recorderController.record();
      emit(state.copyWith(isRecording: true, recordingDuration: 0));
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        add(const UpdateDuration());
      });
    });
    on<UpdateDuration>((event, emit) {
      emit(state.copyWith(recordingDuration: state.recordingDuration + 1));
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
          isRecording: false, isPaused: false, recordingDuration: 0));
    });
  }
  @override
  Future<void> close() {
    timer?.cancel();
    recorderController.dispose();
    return super.close();
  }
}
