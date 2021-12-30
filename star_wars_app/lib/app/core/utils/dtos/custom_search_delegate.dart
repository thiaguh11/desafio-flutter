import 'package:flutter/material.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/widgets/people_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<PeopleData> loadedList;

  CustomSearchDelegate(this.loadedList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, false);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return buildList();
  }

  Widget buildList() {
    final filteredList = loadedList
        .where(
          (p) => p.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
        )
        .toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final people = filteredList[index];
        return PeopleWidget(peopleData: people);
      },
      itemCount: filteredList.length,
    );
  }
}
