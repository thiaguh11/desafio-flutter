import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, _) => const HomePage(),
        ),
      ];
}
