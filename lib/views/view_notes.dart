import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add-note_bottomsheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddNotesBottomSheet();
              });
        },
      ),
      body: const NotesViewBody(),
    );
  }
}
