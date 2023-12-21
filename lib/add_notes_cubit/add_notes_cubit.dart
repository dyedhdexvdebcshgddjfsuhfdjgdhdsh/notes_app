import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/add_notes_cubit/add_notes_state.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<MyState> {
  AddNoteCubit() : super(InitalState());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  Color color = Colors.blue;
  void addNotes(NoteModel noteModel) async {
    emit(AddNotesLoadingSatate());
    try {
      var notesBox = Hive.box<NoteModel>(kname_NotesBox);
      await notesBox.add(noteModel);
      noteModel.color = color.value;
      emit(AddNotesSuccessState());
    } catch (error) {
      emit(AddNotesFailureState('Error : ${error.toString()}'));
    }

    // calling method where T is String
    // add<String>('ahmed');
    // add<int>('ahmed');
  }

  // /* generic type :dynamic datatype*/
  // T add<T>(T name) {
  //   // T--> store database
  //   return name;
  // }
}
