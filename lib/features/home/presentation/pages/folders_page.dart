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
        floatingActionButton: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Criar Baralho'),
                        content: TextField(
                          decoration: InputDecoration(hintText: ''),
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {},
                          ),
                        ],
                      ));
            },
            icon: const Icon(
              Icons.add,
            )),
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

  // Widget _card(BuildContext context, int index) {
  //   return GestureDetector(
  //     child: Card(
  //       child: Padding(
  //         padding: EdgeInsets.all(10.0),
  //         child: Row(children: <Widget>[
  //           Container(
  //             width: 80,
  //             height: 40,
  //           )
  //         ]),
  //       ),
  //     ),
  //   );
  // }
}
