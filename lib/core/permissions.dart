import 'package:permission_handler/permission_handler.dart';

class CameraPermissions {
  static Future<void> askCameraPermission() async {
    final permission = await Permission.camera.isGranted;

    if (!permission) {
      await Permission.camera.request();
    }
  }
}

class AudioPermissions {
  static Future<void> askAudioPermission() async {
    final permission = await Permission.microphone.isGranted;

    if (!permission) {
      await Permission.microphone.request();
    }
  }
}
