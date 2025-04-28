import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/features/home/model/note_model.dart';

class HomeUsecase {
  void saveNote(NoteModel noteModel) async {
    var box = await Hive.openBox('notes');
    box.isOpen;
    await box.put(noteModel.id, noteModel);
  }

  void deleteNote(String id) async {
    var box = await Hive.openBox('notes');
    box.isOpen;
    NoteModel? foundNote = box.values.firstWhere(
      (note) => note.id == id,
      orElse: () => null,
    );

    box.delete(foundNote?.key ?? id);
  }

  Future<List<NoteModel>> getAllNotes() async {
    var box = await Hive.openBox('notes');
    box.isOpen;
    return box.values.cast<NoteModel>().toList();
  }
}
