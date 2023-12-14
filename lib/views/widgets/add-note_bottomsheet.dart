import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/build_buttonaddnote_bottom_sheet.dart';

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

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint, required this.maxLine})
      : super(key: key);
  final String hint;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        maxLines: maxLine,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kPrimaryColor),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(kPrimaryColor)),
      ),
    );
  }
}

OutlineInputBorder buildBorder([Color? color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
