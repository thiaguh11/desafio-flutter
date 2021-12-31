import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/core/resources/strings/app_routes.dart';
import 'package:star_wars_app/app/core/utils/custom_search_delegate.dart';
import 'package:star_wars_app/app/core/widgets/default_scaffold.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/cubits/peoples_cubit.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/states/peoples_state.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/widgets/people_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final PeoplesCubit peoplesCubit = Modular.get<PeoplesCubit>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Modular.get<PeoplesCubit>().fetchPeoples();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      debugPrint("end!");
      Modular.get<PeoplesCubit>().fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(
        title: const Text("StarWars"),
        centerTitle: true,
        actions: <Widget>[
          BlocBuilder(
            bloc: peoplesCubit,
            builder: (ctx, state) => IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    state is Loaded ? state.peoples : [],
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: (ctx, __) => BlocBuilder<PeoplesCubit, PeoplesState>(
        bloc: peoplesCubit,
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is Loaded) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.peoples.length
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    : PeopleWidget(
                        peopleData: state.peoples[index],
                        onTap: () => Modular.to.pushNamed(
                          "./${AppRoutes.peopleDetails}",
                          arguments: state.peoples[index],
                        ),
                      );
              },
              itemCount: !state.hasMoreResults
                  ? state.peoples.length
                  : state.peoples.length + 1,
              controller: _scrollController,
            );
          }

          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
