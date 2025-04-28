import 'package:my_notes/features/home/model/note_model.dart';

abstract class HomeBlocState {}

class HomeBlocInitialState extends HomeBlocState {}

class HomeBlocDeleteState extends HomeBlocState {}

class HomeBlocLoadingState extends HomeBlocState {}

class HomeBlocSuccessState extends HomeBlocState {
  final List<NoteModel> noteModel;
  HomeBlocSuccessState({required this.noteModel});
}
