import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_wars_app/app/app_module.dart';
import 'package:star_wars_app/app/core/resources/strings/hive_strings.dart';

import 'app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();

  await Hive.openBox(HiveStrings.peoples);
  
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
