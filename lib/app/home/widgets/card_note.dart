import 'package:flutter/material.dart';
import 'package:my_notes/design_system.dart';

class CardNoteWidget extends StatelessWidget {
  CardNoteWidget(
      {super.key,
      required this.description,
      required this.title,
      required this.deleteTap,
      required this.date});
  String title;
  String description;
  String date;
  Function() deleteTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: NotesFontSize.medium,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Data: $date',
                      style: const TextStyle(
                          fontSize: NotesFontSize.medium,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text.rich(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          TextSpan(
                            text: description,
                            style:
                                const TextStyle(fontSize: NotesFontSize.small),
                          )),
                    ),
                  ),
                  PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) {
                      if (value == 1) {
                        deleteTap();
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 1,
                          child: Text('Excluir'),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
