import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/edit_note_viewbody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(),
    );
  }
}
