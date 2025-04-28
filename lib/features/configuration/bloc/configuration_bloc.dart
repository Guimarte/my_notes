import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/configuration/bloc/configuration_bloc_event/configuration_bloc_event.dart';
import 'package:my_notes/features/configuration/bloc/configuration_bloc_state/configuration_bloc_state.dart';
import 'package:my_notes/theme.dart';

class ConfigurationBloc
    extends Bloc<ConfigurationBlocEvent, ConfigurationBlocState> {
  ConfigurationBloc()
      : super(ConfigurationInitialBlocState(themeData: ThemeApp().lightTheme)) {
    on<ConfigurationThemeEvent>(_configurationTheme);
  }

  bool _isDark = false;
  bool get isDark => _isDark;

  _configurationTheme(ConfigurationThemeEvent event, Emitter emitter) {
    _isDark = event.isDark;
    if (isDark) {
      emitter(ConfigurationInitialBlocState(themeData: ThemeApp().darkTheme));
    } else {
      emitter(ConfigurationInitialBlocState(themeData: ThemeApp().lightTheme));
    }
  }
}
