import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_notes/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_notes/features/home/presentation/widgets/dialog_add_note.dart';

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
