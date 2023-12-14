import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          CustomTextField()
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Title',
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
