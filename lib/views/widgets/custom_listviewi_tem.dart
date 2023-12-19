import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_notes_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/add_notes_cubit/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_ltem.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // check notesList is null ? ->[] : notes.length
        List<NoteModel> notesList =
            NotesCubit.get(context).fetechAllNotes() ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notesList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: NoteItem(note: notesList[index]),
                );
              }),
        );
      },
    );
  }
}
