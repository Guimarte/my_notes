import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_notes/features/home/presentation/bloc/home_bloc_event/home_bloc_event.dart';
import 'package:my_notes/features/home/presentation/widgets/mixin/dialog_add_note_mixin.dart';

class DialogAddNoteWidget extends StatefulWidget {
  const DialogAddNoteWidget({super.key});

  @override
  State<DialogAddNoteWidget> createState() => _DialogAddNoteWidgetState();
}

class _DialogAddNoteWidgetState extends State<DialogAddNoteWidget>
    with DialogAddNoteMixin {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const Text('Adicionar Nota'),
              const Spacer(),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              const Spacer(),
              TextField(
                controller: contentController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  homeBloc.add(HomeBlocAddNoteEvent(
                      title: titleController.text,
                      content: contentController.text));
                  Modular.to.pop();
                },
                child: const Text('Salvar'),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
