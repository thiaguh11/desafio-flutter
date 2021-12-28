import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/core/widgets/default_scaffold.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/people.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fetch() async {
    final usecase = Modular.get<IPeople>();

    final result = await usecase.getPeoples(1);

    result.fold(
      (error) => debugPrint(error.toString()),
      (data) => debugPrint(data.results.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: (ctx, __) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text("Home Page")),
          MaterialButton(
            onPressed: () async => await fetch(),
            child: const Text("Fetch Data"),
          ),
        ],
      ),
    );
  }
}
