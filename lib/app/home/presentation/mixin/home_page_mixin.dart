import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_notes/app/home/bloc/home_bloc.dart';
import 'package:my_notes/app/home/bloc/home_bloc_event/home_bloc_event.dart';
import 'package:my_notes/app/home/presentation/home_page.dart';

mixin HomePageMixin<T extends StatefulWidget> on State<HomePage> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = Modular.get<HomeBloc>();
    homeBloc.add(HomeBlocInitialEvent());
    super.initState();
  }

  String converterDate(DateTime date) {
    String dateFormat = '${date.day}/${date.month}/${date.year}';
    return dateFormat;
  }
}
