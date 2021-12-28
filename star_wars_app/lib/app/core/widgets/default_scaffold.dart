import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget Function(BuildContext context, BoxConstraints constraints) body;
  final Color? backgroundColor;

  final EdgeInsetsGeometry? padding;

  const DefaultScaffold({
    Key? key,
    this.appBar,
    this.drawer,
    this.padding,
    this.backgroundColor = Colors.white,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        drawer: drawer,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: body.call(context, constraints),
            ),
          ),
        ),
        backgroundColor: backgroundColor,
      );
}
