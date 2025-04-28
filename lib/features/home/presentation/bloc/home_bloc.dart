import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/home/model/note_model.dart';
import 'package:my_notes/features/home/presentation/bloc/home_bloc_event/home_bloc_event.dart';
import 'package:my_notes/features/home/presentation/bloc/home_bloc_state/home_bloc_state.dart';
import 'package:my_notes/features/home/usecase/home_usecase.dart';
import 'package:uuid/uuid.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc({required this.homeUsecase}) : super(HomeBlocInitialState()) {
    on<HomeBlocDeleteEvent>(_onDelete);
    on<HomeBlocAddNoteEvent>(_onSave);
    on<HomeBlocInitialEvent>(_onInitial);
  }

  HomeUsecase homeUsecase;
  List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;

  _onDelete(HomeBlocDeleteEvent event, Emitter emitter) async {
    emitter(HomeBlocLoadingState());

    homeUsecase.deleteNote(event.id);
    _notes = await homeUsecase.getAllNotes();
    emitter(HomeBlocSuccessState(noteModel: _notes));
  }

  _onSave(HomeBlocAddNoteEvent event, Emitter emitter) async {
    emitter(HomeBlocLoadingState());
    NoteModel noteModel = NoteModel(
      id: const Uuid().v4(),
      title: event.title,
      content: event.content,
      createdAt: DateTime.now(),
    );
    homeUsecase.saveNote(noteModel);
    _notes = await homeUsecase.getAllNotes();
    emitter(HomeBlocSuccessState(noteModel: _notes));
  }

  _onInitial(HomeBlocInitialEvent event, Emitter emitter) async {
    emitter(HomeBlocLoadingState());
    await Future.delayed(const Duration(seconds: 10));
    _notes = await homeUsecase.getAllNotes();
    emitter(HomeBlocSuccessState(noteModel: _notes));
  }
}
