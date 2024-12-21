import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_note_state.dart';
part 'voice_note_event.dart';
part 'voice_note_bloc.freezed.dart';

class VoiceNoteBloc extends Bloc<VoiceNoteEvent, VoiceNoteState> {
  VoiceNoteBloc() : super(VoiceNoteState.initial()) {}
}
