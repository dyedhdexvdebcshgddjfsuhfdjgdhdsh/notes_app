import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_note_ltem.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: NoteItem(),
            );
          }),
    );
  }
}
