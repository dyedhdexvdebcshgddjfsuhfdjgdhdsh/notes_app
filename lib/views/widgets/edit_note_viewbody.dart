import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomAppBar(icon: Icons.check, title: 'Edit Notes'),
        ],
      ),
    );
  }
}
