abstract class ConfigurationBlocEvent {}

class ConfigurationThemeEvent extends ConfigurationBlocEvent {
  bool isDark;
  ConfigurationThemeEvent({required this.isDark});
}
