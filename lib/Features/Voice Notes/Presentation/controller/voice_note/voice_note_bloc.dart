import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Domain/voice_note_entity.dart';
import '../../../Domain/voice_note_repository.dart';

part 'voice_note_state.dart';
part 'voice_note_event.dart';
part 'voice_note_bloc.freezed.dart';

class VoiceNoteBloc extends Bloc<VoiceNoteEvent, VoiceNoteState> {
  final RecorderController recorderController = RecorderController();
  final TextEditingController searchController = TextEditingController();
  final VoiceNoteRepository repository;
  Timer? timer;

  VoiceNoteBloc(this.repository) : super(VoiceNoteState.initial()) {
    // searchController.addListener(() {
    //   add(SearchNotes(searchController.text));
    // });
    on<StartRecording>((event, emit) async {
      recorderController.reset();
      Directory appDir = await getApplicationDocumentsDirectory();
      final filePath = '${appDir.path}/${DateTime.now().toIso8601String()}.m4a';
      await recorderController.record(
        path: filePath,
      );
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

    on<StopRecording>((event, emit) async {
      final recordedFilePath = await recorderController.stop();
      timer?.cancel();
      emit(state.copyWith(
        isRecording: false,
        isPaused: false,
        recordingDuration: state.currentRecordingDuration,
        currentRecordingDuration: 0,
        lastRecordedFilePath: recordedFilePath,
      ));
    });
    on<SaveVoiceNote>((event, emit) async {
      final id = DateTime.now().toIso8601String();
      final filePath = state.lastRecordedFilePath;

      if (filePath == null || !File(filePath).existsSync()) {
        log("Error: Recorded file does not exist");
        return;
      }

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
    List<VoiceNote> filterNotes(String query, List<VoiceNote> notes) {
      if (query.isEmpty) {
        return notes;
      }
      return notes.where((note) => note.title.contains(query)).toList();
    }

    on<PlayVoiceNote>((event, emit) async {
      for (var note in state.notes) {
        if (note.isPlaying) {
          await note.audioPlayer.stop();
        }
      }
      final updatedNotes = state.notes.map((note) {
        if (note.id == event.id) {
          return note.copyWith(isPlaying: true);
        } else {
          return note.copyWith(isPlaying: false);
        }
      }).toList();

      emit(state.copyWith(
          notes: updatedNotes,
          filteredNotes: filterNotes(searchController.text, updatedNotes)));
      final note = updatedNotes.firstWhere((note) => note.id == event.id);

      final file = File(note.filePath);
      if (!await file.exists()) {
        log("Error: File does not exist at ${note.filePath}");
      }

      log("Playing audio from: ${note.filePath}");
      try {
        await note.audioPlayer.setFilePath(note.filePath);
        note.audioPlayer.play();

        //note.audioPlayer.playerStateStream.listen(null).cancel();

        note.audioPlayer.playerStateStream.listen((state) {
          if (state.processingState == ProcessingState.completed) {
            add(VoiceNoteEvent.pauseVoiceNote(event.id));
          }
        });
      } catch (e) {
        log('Error playing audio: $e');
        add(VoiceNoteEvent.pauseVoiceNote(event.id));
      }
    });

    on<PauseVoiceNote>((event, emit) async {
      final updatedNotes = state.notes.map((note) {
        if (note.id == event.id) {
          note.audioPlayer.pause();
          return note.copyWith(isPlaying: false);
        }
        return note;
      }).toList();
      final updatedFilteredNotes = state.filteredNotes.map((note) {
        if (note.id == event.id) {
          note.audioPlayer.pause();
          return note.copyWith(isPlaying: false);
        }
        return note;
      }).toList();

      emit(state.copyWith(
          notes: updatedNotes, filteredNotes: updatedFilteredNotes));
    });

    on<DeleteVoiceNote>((event, emit) async {
      await repository.deleteVoiceNote(event.id);
      final updatedNotes = await repository.fetchVoiceNotes();

      final updatedFilteredNotes = List<VoiceNote>.from(state.filteredNotes)
        ..removeWhere((note) => note.id == event.id);
      emit(state.copyWith(
        notes: updatedNotes,
        filteredNotes: updatedFilteredNotes,
      ));
    });

    on<FetchVoiceNotes>((event, emit) async {
      final notes = await repository.fetchVoiceNotes();
      emit(state.copyWith(notes: notes));
    });
    on<SearchNotes>((event, emit) {
      final filteredNotes = filterNotes(event.query, state.notes);
      // final filteredNotes = state.notes
      //     .where((note) =>
      //         note.title.toLowerCase().contains(query) ||
      //         note.recordedDate.toString().contains(query))
      //     .toList();

      emit(state.copyWith(filteredNotes: filteredNotes));
    });
  }
  @override
  Future<void> close() {
    timer?.cancel();
    recorderController.dispose();
    searchController.dispose();
    return super.close();
  }
}
