import 'package:flutter/material.dart';
import 'package:star_wars_app/app/core/resources/styles/text_styles.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';

class PeopleWidget extends StatelessWidget {
  final PeopleData peopleData;

  const PeopleWidget({
    Key? key,
    required this.peopleData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                peopleData.name ?? "N/A",
                style: TextStyles.title,
              ),
              Text(
                "Altura: ${peopleData.height ?? "N/A"}",
                style: TextStyles.subtitle,
              ),
              Text(
                "Gender: ${peopleData.gender ?? "N/A"}",
                style: TextStyles.subtitle,
              ),
              Text(
                "Mass: ${peopleData.mass ?? "N/A"}",
                style: TextStyles.subtitle,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 4,
          color: Colors.grey,
        ),
      ],
    );
  }
}
