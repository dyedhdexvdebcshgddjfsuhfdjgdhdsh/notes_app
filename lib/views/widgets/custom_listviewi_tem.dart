import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
import 'package:notes_app/notes_cubit/notes_states.dart';
import 'package:notes_app/views/widgets/custom_note_ltem.dart';
import 'package:notes_app/views/widgets/empty_home.dart';

class ListViewItem extends StatefulWidget {
  const ListViewItem({Key? key}) : super(key: key);

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
// Retrieve the notes list from the NotesCubit using context.watch
        List<NoteModel> notesList = context.watch<NotesCubit>().notes ?? [];
        if (state is NotesSuccessState) {
// Fetch all notes again when NotesSuccessState is received
          context.read<NotesCubit>().fetechAllNotes();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemCount: notesList.isEmpty ? 1 : notesList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              //  if(){}
              return notesList.isEmpty
                  ? Center(child: EmptyHome())
                  : Dismissible(
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (value) {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Delete Confirmation"),
                                content: const Text(
                                  "Are you sure you want to delete this Note ?",
                                  style: TextStyle(fontSize: 20),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                      color: Colors.red,
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      }),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  MaterialButton(
                                      color: Colors.red,
                                      child: const Text('Delete'),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      }),
                                ],
                              );
                            });
                      },
                      background: Container(
                        padding: EdgeInsets.only(right: 12),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          size: 80,
                          color: Colors.redAccent,
                        ),
                        color: Colors.white.withOpacity(0.132),
                      ),
                      key: Key('item ${notesList[index].toString()}'),
                      onDismissed: (DismissDirection direction) {
                        if (direction == DismissDirection.startToEnd) {
                          print("Add to favorite");
                        } else {
                          print('Remove item');
                        }
                        setState(() {
                          notesList.removeAt(index).delete();
                          NotesCubit.get(context).fetechAllNotes();
                          notesList[index].delete();
                        });
                      },
                      child: NoteItem(noteModel: notesList[index]));
            },
          ),
        );
      },
    );
  }
}
