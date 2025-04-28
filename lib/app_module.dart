import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_notes/features/configuration/bloc/configuration_bloc.dart';
import 'package:my_notes/features/home/bloc/home_bloc.dart';
import 'package:my_notes/features/home/presentation/home_page.dart';
import 'package:my_notes/features/home/usecase/home_usecase.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }

  @override
  void binds(Injector i) {
    i.addSingleton(() => HomeUsecase());
    i.addSingleton(ConfigurationBloc.new);
    i.addSingleton(() => HomeBloc(homeUsecase: i.get<HomeUsecase>()));
  }
}
