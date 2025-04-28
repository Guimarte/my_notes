abstract class HomeBlocEvent {}

class HomeBlocInitialEvent extends HomeBlocEvent {}

class HomeBlocDeleteEvent extends HomeBlocEvent {
  final String id;
  HomeBlocDeleteEvent({required this.id});
}

class HomeBlocAddNoteEvent extends HomeBlocEvent {
  final String title;
  final String content;
  HomeBlocAddNoteEvent({required this.title, required this.content});
}
