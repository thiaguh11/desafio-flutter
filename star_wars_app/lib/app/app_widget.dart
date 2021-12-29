import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    ).modular();
  }
}
