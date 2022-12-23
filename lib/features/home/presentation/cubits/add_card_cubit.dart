import 'package:ebbinghaus_method/core/camera/i_camera_wrapper.dart';
import 'package:ebbinghaus_method/core/utils/text_recognition/text_recognition.dart';
import 'package:ebbinghaus_method/features/home/domain/usecases/post_card_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit(this._postCardUseCase, this._textRecognition, this._camera)
      : super(AddCardSuccessState());

  final PostCardUseCase _postCardUseCase;
  final TextRecognition _textRecognition;
  final ICamera _camera;

  Future<void> addCard(
      String pergunta, String resposta, int folderId, String? tags) async {
    await _postCardUseCase(
        CardParams(pergunta, resposta, folderId, tags ?? ""));
  }

  Future<String> scanearTexto(String id) async {
    await initCamera();
    final imagemResult = await _camera.imagePickerCamera(id);
    return await imagemResult.fold(
        (l) =>
            "A câmera não conseguiu ler, tente aproximar ou melhorar a qualidade da imagem",
        (imagem) async {
      final result = await _textRecognition.processedTextFromFile(imagem);
      return result.join();
    });
  }

  Future<void> initCamera() async {
    await _camera.inicializarCamera();
    await _camera.cameraController!.initialize();
  }
}
