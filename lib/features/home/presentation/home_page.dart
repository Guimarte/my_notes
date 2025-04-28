import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/configuration/bloc/configuration_bloc_event/configuration_bloc_event.dart';
import 'package:my_notes/features/home/mixin/home_page_mixin.dart';
import 'package:my_notes/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_notes/features/home/presentation/bloc/home_bloc_event/home_bloc_event.dart';
import 'package:my_notes/features/home/presentation/bloc/home_bloc_state/home_bloc_state.dart';
import 'package:my_notes/features/home/presentation/widgets/add_button.dart';
import 'package:my_notes/features/home/presentation/widgets/card_note.dart';
import 'package:my_notes/features/home/presentation/widgets/dialog_read_note.dart';
import 'package:my_notes/features/home/presentation/widgets/drawer_options.dart';
import 'package:my_notes/features/home/presentation/widgets/shimmer_loading.dart';

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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: const DrawerOptions(),
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Notas'),
          actions: [
            IconButton(
                onPressed: () {
                  configurationBloc.add(ConfigurationThemeEvent(
                      isDark: !configurationBloc.isDark));
                },
                icon: const Icon(Icons.brightness_3))
          ],
        ),
        floatingActionButton: const AddButtonWidget(),
        body: BlocBuilder<HomeBloc, HomeBlocState>(
          bloc: homeBloc,
          builder: (context, state) {
            if (state is HomeBlocLoadingState) {
              return ListView(
                children: const [
                  ShimmerLoadingWidget(),
                ],
              );
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                  itemCount: homeBloc.notes.length,
                  itemBuilder: (context, index) {
                    switch (state) {
                      case HomeBlocSuccessState():
                        return CardNoteWidget(
                          description: state.noteModel[index].content,
                          title: state.noteModel[index].title,
                          date: converterDate(state.noteModel[index].createdAt),
                          deleteTap: () {
                            homeBloc.add(HomeBlocDeleteEvent(
                                id: state.noteModel[index].id));
                          },
                          cardTap: () {
                            showDialog(
                                useSafeArea: true,
                                context: context,
                                builder: (_) {
                                  return DialogReadNoteWidget(
                                      content: state.noteModel[index].content,
                                      title: state.noteModel[index].title);
                                });
                          },
                        );

                      case HomeBlocLoadingState():
                        return const ShimmerLoadingWidget();

                      default:
                        return const SizedBox.shrink();
                    }
                  }),
            );
          },
        ),
      ),
    );
  }
}
