import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_notes_app/Features/Voice%20Notes/Presentation/views/widgets/save_dialog.dart';

import '../../controller/voice_note/voice_note_bloc.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VoiceNoteBloc>();

    return BlocBuilder<VoiceNoteBloc, VoiceNoteState>(
      builder: (context, state) {
        final minutes = state.currentRecordingDuration ~/ 60;
        final seconds = state.currentRecordingDuration % 60;

        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: AudioWaveforms(
                    size: Size(MediaQuery.of(context).size.width, 100.0),
                    recorderController: bloc.recorderController,
                    waveStyle: const WaveStyle(
                      waveColor: Colors.pink,
                      extendWaveform: true,
                      showMiddleLine: false,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: state.isRecording
                        ? () => bloc.add(const PauseRecording())
                        : null,
                    icon: Icon(
                      state.isPaused ? Icons.play_arrow : Icons.pause,
                      color: Colors.white,
                    ),
                    label: Text(
                      state.isPaused ? 'Resume' : 'Pause',
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xff82e6ed), //const Color(0xffCE93D8),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: state.isRecording
                        ? () {
                            bloc.add(const StopRecording());
                            final defaultName =
                                'Voice Note ${DateTime.now().toIso8601String()}';

                            showSaveNoteDialog(
                              context,
                              defaultName,
                              (noteName) async {
                                bloc.add(SaveVoiceNote(noteName));
                              },
                            );
                          }
                        : null,
                    icon: const Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Stop',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
