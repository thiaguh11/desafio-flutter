import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/core/widgets/default_scaffold.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/cubits/home_page_cubit.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/states/home_page_state.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/widgets/people_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Modular.get<HomePageCubit>().fetchPeoples();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      debugPrint("end!");
      Modular.get<HomePageCubit>().fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(
        title: const Text("StarWars"),
        centerTitle: true,
      ),
      body: (ctx, __) => BlocBuilder<HomePageCubit, HomePageState>(
        bloc: Modular.get<HomePageCubit>(),
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
                    : PeopleWidget(peopleData: state.peoples[index]);
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
