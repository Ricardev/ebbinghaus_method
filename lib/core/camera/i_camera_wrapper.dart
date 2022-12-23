import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

abstract class ICamera {
  late CameraController? cameraController;
  Future<void> inicializarCamera();
  Future<Either<Exception, File>> tirarFoto(String id);
  Future<Either<Exception, File>> imagePickerCamera(String id);
  Future<Either<Exception, bool>> gravarVideo();
  Future<Either<Exception, String>> stopVideo(String id);
  void disposeCamera();
  Future<String> getFileDirectory();
  Future<File> cropImage(String filePath);
}
