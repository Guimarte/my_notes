import 'package:my_notes/app/home/model/note_model.dart';

abstract class HomeBlocState {}

class HomeBlocInitialState extends HomeBlocState {
  final List<NoteModel> noteModel;
  HomeBlocInitialState({required this.noteModel});
}

class HomeBlocDeleteState extends HomeBlocState {}

class HomeBlocLoadingState extends HomeBlocState {}

class HomeBlocSuccessState extends HomeBlocState {
  final List<NoteModel> noteModel;
  HomeBlocSuccessState({required this.noteModel});
}
