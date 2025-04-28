import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/app/home/bloc/home_bloc.dart';
import 'package:my_notes/app/home/bloc/home_bloc_event/home_bloc_event.dart';
import 'package:my_notes/app/home/bloc/home_bloc_state/home_bloc_state.dart';
import 'package:my_notes/app/home/presentation/mixin/home_page_mixin.dart';
import 'package:my_notes/app/home/widgets/add_button.dart';
import 'package:my_notes/app/home/widgets/card_note.dart';
import 'package:my_notes/app/home/widgets/drawer_options.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerOptions(),
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Notas'),
        ),
        floatingActionButton: const AddButtonWidget(),
        body: BlocBuilder<HomeBloc, HomeBlocState>(
          bloc: homeBloc,
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                  reverse: true,
                  itemCount: homeBloc.notes.length,
                  itemBuilder: (context, index) {
                    if (state is HomeBlocSuccessState) {
                      return CardNoteWidget(
                        description: state.noteModel[index].content,
                        title: state.noteModel[index].title,
                        date: converterDate(state.noteModel[index].createdAt),
                        deleteTap: () {
                          homeBloc.add(HomeBlocDeleteEvent(
                              id: state.noteModel[index].id));
                        },
                      );
                    }
                    if (state is HomeBlocInitialState) {
                      return CardNoteWidget(
                        description: state.noteModel[index].content,
                        title: state.noteModel[index].title,
                        date: converterDate(state.noteModel[index].createdAt),
                        deleteTap: () {
                          homeBloc.add(HomeBlocDeleteEvent(
                              id: state.noteModel[index].id));
                        },
                      );
                    }
                    if (state is HomeBlocLoadingState) {
                      return Shimmer(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 224, 224, 224),
                            Color.fromARGB(255, 189, 189, 189),
                          ],
                        ),
                        enabled: true,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            for (int i = 0; i < 5; i++) {
                              return CardNoteWidget(
                                description: '',
                                title: '',
                                date: '',
                                deleteTap: () {},
                              );
                            }
                            return null;
                          },
                        ),
                      );
                    }

                    return null;
                  }),
            );
          },
        ),
      ),
    );
  }
}
