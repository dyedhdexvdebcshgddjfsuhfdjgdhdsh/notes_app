import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/add_notes_cubit/add_notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
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
              ColorItem(),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<AddNoteCubit, MyState>(
                builder: (context, state) {
                  return CustomButtonAddNote(
                      isLoading: state is AddNotesLoadingSatate ? true : false,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          var currentDate = DateTime.now();
                          var formattedCurrentDate =
                              DateFormat.yMd().format(currentDate);
                          var note_model = NoteModel(
                              title: title!,
                              subtitle: subTitle!,
                              date: DateTime.now().toString(),
                              color: Colors.blue.value);
                          AddNoteCubit.get(context).addNotes(note_model);
                          NotesCubit.get(context).fetechAllNotes();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.blue,
    );
  }
}

class ColorListView extends StatelessWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ColorItem();
        });
  }
}
