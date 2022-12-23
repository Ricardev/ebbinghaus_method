import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'camera_error.dart';
import 'i_camera_wrapper.dart';

class Camera implements ICamera {
  @override
  late CameraController? cameraController;

  late List<CameraDescription> cameras;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<void> inicializarCamera() async {
    final permission = await Permission.camera.isGranted;

    if (!permission) {
      final permissionRequest = await Permission.camera.request();
      if (permissionRequest.isDenied) {
        throw CameraError("Não obteve permissão");
      }
    }
    cameras = await availableCameras();
    cameraController = CameraController(cameras.first, ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.yuv420);
    await cameraController!.initialize();
  }

  @override
  Future<Either<CameraException, File>> tirarFoto(String id) async {
    try {
      XFile rawImage = await cameraController!.takePicture();
      final imageFile = File(rawImage.path);
      final applicationDirectory = await getFileDirectory();
      await imageFile.copy(formatToFilePath(applicationDirectory, id));
      return Right(imageFile);
    } on CameraException catch (e) {
      debugPrint(e.code);
      debugPrint(e.description);
      return Left(CameraException(e.code, e.description));
    }
  }

  @override
  Future<Either<CameraException, bool>> gravarVideo() async {
    try {
      await cameraController!.startVideoRecording();
      return Right(true);
    } on CameraException catch (e) {
      return Left(CameraException(e.code, e.description));
    }
  }

  @override
  Future<Either<CameraException, String>> stopVideo(String id) async {
    try {
      final rawVideo = await cameraController!.stopVideoRecording();
      File videoFile = File(rawVideo.path);
      final applicationDirectory = await getFileDirectory();
      await videoFile.copy(formatToFilePath(applicationDirectory, id));
      return Right(videoFile.path);
    } on CameraException catch (e) {
      return Left(CameraException(e.code, e.description));
    }
  }

  @override
  void disposeCamera() {
    try {
      if (cameraController != null || cameraController!.value.isInitialized) {
        cameraController!.dispose();
      }
    } catch (e) {
      debugPrint("Não foi possível dar dispose na câmera $e");
    }
  }

  @override
  Future<String> getFileDirectory() async {
    final directoryPath = await getApplicationDocumentsDirectory();
    return directoryPath.path;
  }

  String formatToFilePath(String filePath, String identification) {
    return '${filePath}_$identification';
  }

  @override
  Future<Either<Exception, File>> imagePickerCamera(String id) async {
    try {
      final rawImage = await _imagePicker.pickImage(source: ImageSource.camera);
      final imageCropped = await cropImage(rawImage!.path);
      final imageFile = File(imageCropped.path);
      final applicationDirectory = await getFileDirectory();
      await imageFile.copy(formatToFilePath(applicationDirectory, id));
      return Right(imageFile);
    } on CameraException catch (e) {
      debugPrint(e.code);
      debugPrint(e.description);
      return Left(CameraException(e.code, e.description));
    }
  }

  @override
  Future<File> cropImage(String filePath) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: filePath,
          aspectRatioPresets: Platform.isAndroid
              ? [
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio16x9
                ]
              : [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio5x3,
                  CropAspectRatioPreset.ratio5x4,
                  CropAspectRatioPreset.ratio7x5,
                  CropAspectRatioPreset.ratio16x9
                ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.blueAccent,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(
              title: 'Cropper',
            )
          ]);
      File croppedImage = File(croppedFile!.path);
      return croppedImage;
    } catch (e) {
      throw CameraException("Error", "Erro ao fazer o crop da imagem");
    }
  }
}
