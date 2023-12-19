import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/add_notes_cubit/notes_cubit/notes_states.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitalState());

  static NotesCubit get(context) => BlocProvider.of(context);

  fetechAllNotes() {
    // try {
    var notesBox = Hive.box<NoteModel>(kname_NotesBox);
    List<NoteModel> notesList = notesBox.values.toList();

    // emit(NotesSuccessState(notesList));
    // } catch (error) {
    //   emit(NotesFailureState('Error : ${error.toString()}'));
    // }
  }
}
