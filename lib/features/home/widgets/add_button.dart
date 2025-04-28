import 'package:flutter/material.dart';
import 'package:my_notes/features/home/widgets/dialog_add_note.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return const DialogAddNoteWidget();
            });
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.add),
    );
  }
}
