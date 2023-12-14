import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_note_ltem.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: NoteItem(),
      );
    });
  }
}
