import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/text_field_bottom_sheet.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomAppBar(
              icon: Icons.check,
              title: 'Edit Notes',
              onPressed: () {
                widget.noteModel.title = title ?? widget.noteModel.title;
                // override on variables of model if it not null assignation with new value
                // or it with null assign with old value
                widget.noteModel.subtitle =
                    content ?? widget.noteModel.subtitle;
                widget.noteModel.save();
                Navigator.of(context).pop();
              }),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'Title',
            maxLine: 1,
            onChanged: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 14,
          ),
          CustomTextField(
              hint: 'Content',
              maxLine: 5,
              onChanged: (value) {
                content = value;
              }),
        ],
      ),
    );
  }
}
