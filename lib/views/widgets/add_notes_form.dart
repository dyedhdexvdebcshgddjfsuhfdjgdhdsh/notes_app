import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/build_buttonaddnote_bottom_sheet.dart';
import 'package:notes_app/views/widgets/text_field_bottom_sheet.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Expanded(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                CustomTextField(
                    hint: 'Title',
                    maxLine: 1,
                    onSaved: (value) {
                      title = value;
                    }),
                SizedBox(height: 12),
                CustomTextField(
                    maxLine: 4,
                    hint: 'Content',
                    onSaved: (value) {
                      subTitle = value;
                    }),
                SizedBox(
                  height: 30,
                ),
                CustomButtonAddNote(onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
