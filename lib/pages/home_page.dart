import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/git_repo_bloc.dart';
import '../models/item_model.dart';
import '../utils/ui_components.dart';
import 'common_widgets/repo_tile_widget.dart';
import 'common_widgets/star_rating_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GitRepoBloc _repoBloc = GitRepoBloc();
  List<ItemModel> repoItems = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () => _loadData(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildHeader(),
              const SizedBox(
                height: 50,
              ),
              BlocProvider(
                create: (_) => _repoBloc,
                child: BlocListener<GitRepoBloc, GitRepoState>(
                    listener: (context, state) {
                  if (state is GitRepoError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message!),
                      ),
                    );
                  }
                  if (state is GitRepoLoaded) {
                    setState(() {
                      repoItems = state.items;
                    });
                  }
                }, child: BlocBuilder<GitRepoBloc, GitRepoState>(
                  builder: (context, state) {
                    if (state is GitRepoLoaded) {
                      return buildView();
                    } else if (state is GitRepoError) {
                      return Container();
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildView() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: repoItems.length,
        itemBuilder: (context, index) {
          return RepoTileWidget(
            model: repoItems[index],
          );
        });
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Hello User!",
          style: TextStyle(
            fontSize: kBody1,
            fontWeight: FontWeight.w700,
            color: kBodyColor,
          ),
        ),
        Text(
          "Checkout the current\ntop repositories!",
          style: TextStyle(
            fontSize: kHeader,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<void> _loadData() async {
    _repoBloc.add(const OnFetch());
  }
}
