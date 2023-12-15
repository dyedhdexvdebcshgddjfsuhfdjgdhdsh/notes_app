import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/text_field_bottom_sheet.dart';

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
          SizedBox(
            height: 20,
          ),
          CustomTextField(hint: 'Title', maxLine: 1),
          SizedBox(
            height: 14,
          ),
          CustomTextField(hint: 'Content', maxLine: 5),
        ],
      ),
    );
  }
}
