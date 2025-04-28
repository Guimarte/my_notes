import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_notes/app/home/bloc/home_bloc.dart';
import 'package:my_notes/app/home/widgets/dialog_add_note.dart';

mixin DialogAddNoteMixin<T extends StatefulWidget>
    on State<DialogAddNoteWidget> {
  late HomeBloc homeBloc;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    homeBloc = Modular.get<HomeBloc>();
    super.initState();
  }
}
