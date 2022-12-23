import 'package:ebbinghaus_method/core/dependency_injection.dart';
import 'package:ebbinghaus_method/features/home/presentation/cubits/add_card_cubit.dart';
import 'package:ebbinghaus_method/features/home/presentation/states/add_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardPage extends StatelessWidget {
  AddCardPage({super.key, required this.folderId});
  final perguntaController = TextEditingController();
  final respostaController = TextEditingController();
  final int folderId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<AddCardCubit>(),
      child: BlocBuilder<AddCardCubit, AddCardState>(
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: perguntaController,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: "Pergunta",
                            label: Text("Pergunta"),
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  perguntaController.text = await context
                                      .read<AddCardCubit>()
                                      .scanearTexto("Pergunta");
                                },
                                child: Icon(Icons.camera_alt))),
                      ),
                      TextField(
                        controller: respostaController,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: "Resposta",
                            label: Text("Resposta"),
                            suffixIcon: GestureDetector(
                                onTap: () {}, child: Icon(Icons.camera_alt))),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextButton(
                          onPressed: () async {
                            await context.read<AddCardCubit>().addCard(
                                perguntaController.text,
                                respostaController.text,
                                folderId,
                                null);
                            perguntaController.clear();
                            respostaController.clear();
                          },
                          child: Text("Salvar Card"))
                    ],
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
