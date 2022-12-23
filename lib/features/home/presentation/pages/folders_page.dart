import 'package:ebbinghaus_method/core/dependency_injection.dart';
import 'package:ebbinghaus_method/features/home/presentation/cubits/home_cubit.dart';
import 'package:ebbinghaus_method/features/home/presentation/pages/add_card_page.dart';
import 'package:ebbinghaus_method/features/home/presentation/states/folders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoldersPage extends StatelessWidget {
  FoldersPage({super.key});

  final TextEditingController folderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = injector<HomeCubit>();
    provider.obterFolders();
    return BlocProvider<HomeCubit>(
      create: (context) => provider,
      child: Scaffold(
        floatingActionButton: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Criar Baralho'),
                        content: TextField(
                          controller: folderNameController,
                          decoration: InputDecoration(hintText: ''),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          BlocProvider(
                            create: (context) => provider,
                            child: BlocBuilder<HomeCubit, FoldersPageState>(
                              builder: (context, state) => TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  context
                                      .read<HomeCubit>()
                                      .postFolder(folderNameController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ));
            },
            icon: const Icon(
              Icons.add,
            )),
        appBar: AppBar(
          title: Text("Ebbinghaus Method"),
        ),
        body: BlocBuilder<HomeCubit, FoldersPageState>(
          builder: (context, state) {
            if (state is FoldersPageSuccessState) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
                child: ListView.builder(
                    itemCount: state.folders.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Text(state.folders[index].name),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => AddCardPage(
                                  folderId: state.folders[index].id!)));
                        },
                      );
                    }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
