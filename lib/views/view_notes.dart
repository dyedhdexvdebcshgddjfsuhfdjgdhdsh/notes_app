import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/views/widgets/add-note_bottomsheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              context: context,
              builder: (context) {
                return BlocProvider(
                    create: (context) => AddNoteCubit(),
                    child: AddNotesBottomSheet());
              });
        },
      ),
      body: const NotesViewBody(),
    );
  }
}
