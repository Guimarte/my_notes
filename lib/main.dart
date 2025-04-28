import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_notes/app/app_widget.dart';
import 'package:my_notes/app_module.dart';
import 'package:my_notes/implementations/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseImplementation.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ModularApp(module: AppModule(), child: const AppWidget());
  }
}
