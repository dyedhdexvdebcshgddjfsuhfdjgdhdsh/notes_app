import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/add_notes_cubit/add_notes_state.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

class AddNotesCubit extends Cubit<State> {
  AddNotesCubit() : super(InitalState());

  Future<void> addNotes(NoteModel noteModel) async {
    try {
      emit(SuccessState());
      var notesBox = Hive.box<NoteModel>(kname_NotesBox);
      await notesBox.add(noteModel);
    } catch (error) {
      emit(FailureState('Error : ${error}'));
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
