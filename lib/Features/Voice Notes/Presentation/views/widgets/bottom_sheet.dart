import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/voice_note/voice_note_bloc.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VoiceNoteBloc>();

    return BlocBuilder<VoiceNoteBloc, VoiceNoteState>(
      builder: (context, state) {
        final minutes = state.recordingDuration ~/ 60;
        final seconds = state.recordingDuration % 60;

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
                child: AudioWaveforms(
                  size: Size(MediaQuery.of(context).size.width, 100.0),
                  recorderController: bloc.recorderController,
                  waveStyle: const WaveStyle(
                    waveColor: Colors.pink,
                    extendWaveform: true,
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
                    icon: Icon(state.isPaused ? Icons.play_arrow : Icons.pause),
                    label: Text(state.isPaused ? 'Resume' : 'Pause'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffCE93D8),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: state.isRecording
                        ? () {
                            bloc.add(const StopRecording());
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Save Recording?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Discard',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final bloc =
                                          context.read<VoiceNoteBloc>();
                                      bloc.add(SaveVoiceNote(
                                          'Note ${bloc.state.notes.length + 1}'));
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Color(0xff1E88E5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        : null,
                    icon: const Icon(Icons.stop),
                    label: const Text('Stop'),
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
