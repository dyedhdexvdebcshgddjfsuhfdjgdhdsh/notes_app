import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_cubit/notes_states.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitalState());

  static NotesCubit get(context) => BlocProvider.of(context);

  List<NoteModel>? notes;

  fetechAllNotes() {
    // try {
    var notesBox = Hive.box<NoteModel>(kname_NotesBox);
    notes = notesBox.values.toList();
    print(notes);
    emit(NotesSuccessState(notes!));
    // } catch (error) {
    //   emit(NotesFailureState('Error : ${error.toString()}'));
    // }
  }
}
