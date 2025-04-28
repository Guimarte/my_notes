import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/app/home/model/note_model.dart';

class DatabaseImplementation {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
  }
}
