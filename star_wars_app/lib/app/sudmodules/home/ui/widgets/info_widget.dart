import 'package:flutter/material.dart';
import 'package:star_wars_app/app/core/resources/styles/text_styles.dart';

class InfoWidget extends StatelessWidget {
  final String label;
  final String? value;
  final double bottomMargin;

  const InfoWidget({
    Key? key,
    required this.label,
    required this.value,
    this.bottomMargin = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (value?.isNotEmpty ?? false)
        ? Padding(
            padding: EdgeInsets.only(bottom: bottomMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyles.label,
                ),
                Text(
                  value!,
                  style: TextStyles.title,
                ),
              ],
            ),
          )
        : Container();
  }
}
