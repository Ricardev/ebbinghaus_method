import 'package:ebbinghaus_method/core/dependency_injection.dart';
import 'package:ebbinghaus_method/cubits/home_cubit.dart';
import 'package:ebbinghaus_method/features/home/presentation/states/folders_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoldersPage extends StatelessWidget {
  const FoldersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<HomeCubit>(),
      child: Scaffold(
        floatingActionButton:
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
        appBar: AppBar(),
        body: BlocBuilder<HomeCubit, FoldersPageState>(
          builder: (context, state) {
            if (state is FoldersPageSuccessState) {
              return ListView.builder(
                  itemCount: state.folders.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(state.folders[index].name),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
