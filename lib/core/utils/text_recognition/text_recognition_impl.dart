import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'text_recognition.dart';

class TextRecognitionImpl extends TextRecognition {
  final textRecognizer = TextRecognizer();

  TextRecognitionImpl();

  @override
  Future<List<String>> processedTextFromPath(String filePath) async {
    final inputImage = InputImage.fromFilePath(filePath);

    final recognizedText = await textRecognizer.processImage(inputImage);

    return recognizedText.blocks.map((block) => block.text).toList();
  }

  @override
  Future<List<String>> processedTextFromFile(File file) async {
    final inputImage = InputImage.fromFile(file);

    final recognizedText = await textRecognizer.processImage(inputImage);

    return recognizedText.blocks.map((block) => block.text).toList();
  }
}
