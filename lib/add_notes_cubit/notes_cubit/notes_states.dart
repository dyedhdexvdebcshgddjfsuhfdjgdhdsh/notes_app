import 'package:notes_app/models/note_model.dart';

abstract class NotesState {}

class NotesInitalState extends NotesState {}

class NotesLoadingState extends NotesState {}

class NotesSuccessState extends NotesState {
  List<NoteModel> notes;
  NotesSuccessState(this.notes);
}

class NotesFailureState extends NotesState {
  final String errorMessage;
  NotesFailureState(this.errorMessage);
}
