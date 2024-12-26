//  showDialog(
//                               context: context,
//                               builder: (_) => AlertDialog(
//                                 title: const Text('Save Recording?'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text(
//                                       'Discard',
//                                       style: TextStyle(color: Colors.red),
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       final bloc =
//                                           context.read<VoiceNoteBloc>();
//                                       bloc.add(SaveVoiceNote(
//                                           'Note ${bloc.state.notes.length + 1}'));
//                                       Navigator.pop(context);
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text(
//                                       'Save',
//                                       style: TextStyle(
//                                         color: Color(0xff1E88E5),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );

import 'package:flutter/material.dart';

void showSaveNoteDialog(
    BuildContext context, String defaultName, Function(String) onSave) {
  final TextEditingController textController =
      TextEditingController(text: defaultName)
        ..selection =
            TextSelection(baseOffset: 0, extentOffset: defaultName.length);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Save Voice Note'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'Note Name',
              hintText: 'Enter a name for the voice note',
            ),
            autofocus: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name cannot be empty';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final noteName = textController.text.trim();
                onSave(noteName);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xff1E88E5),
              ),
            ),
          ),
        ],
      );
    },
  );
}
