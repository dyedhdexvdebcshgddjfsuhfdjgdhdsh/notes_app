import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/build_buttonaddnote_bottom_sheet.dart';
import 'package:notes_app/views/widgets/text_field_bottom_sheet.dart';

class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextField(hint: 'Title', maxLine: 1),
            SizedBox(height: 12),
            CustomTextField(maxLine: 4, hint: 'Content'),
            SizedBox(
              height: 30,
            ),
            CustomButtonAddNote(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
