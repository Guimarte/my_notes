import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_notes/features/configuration/bloc/configuration_bloc.dart';
import 'package:my_notes/features/configuration/bloc/configuration_bloc_state/configuration_bloc_state.dart';
import 'package:my_notes/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = Modular.get<ConfigurationBloc>();

    return BlocBuilder<ConfigurationBloc, ConfigurationBlocState>(
      bloc: themeBloc,
      builder: (context, state) {
        if (state is ConfigurationInitialBlocState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.themeData,
            //darkTheme: ThemeApp().darkTheme,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        }
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeApp().lightTheme,
          darkTheme: ThemeApp().darkTheme,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        );
      },
    );
  }
}
