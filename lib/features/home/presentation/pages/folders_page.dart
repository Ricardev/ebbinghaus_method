import 'package:ebbinghaus_method/cubits/folders_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoldersPage extends StatelessWidget {
  const FoldersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoldersPageCubit(),
      child: Scaffold(
        floatingActionButton:
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
        appBar: AppBar(),
        body: ListView.builder(itemBuilder: (context, index) {
          return Container();
        }),
      ),
    );
  }
}
