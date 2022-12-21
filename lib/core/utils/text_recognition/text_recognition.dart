import 'dart:io';

abstract class TextRecognition {
  Future<List<String>> processedTextFromPath(String filePath);
  Future<List<String>> processedTextFromFile(File file);
}
